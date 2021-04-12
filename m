Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD970
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 01:14:53 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FJW1V4y3Zz9ygF;
	Mon, 12 Apr 2021 09:12:30 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 09:14:37 +0800
Subject: Re: [PATCH] staging: fieldbus: simplify
 devm_anybuss_host_common_probe
To: Sven Van Asbroeck <thesven73@gmail.com>, Tian Tao <tiantao6@hisilicon.com>
CC: Greg KH <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1617957240-53633-1-git-send-email-tiantao6@hisilicon.com>
 <CAGngYiVfattJKO7npMHTagxNfzU-B=rP3FoZ89_yzy-c=Zw2RQ@mail.gmail.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <44f55f42-cb52-f705-c40a-6d5c1844f56b@huawei.com>
Date: Mon, 12 Apr 2021 09:14:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGngYiVfattJKO7npMHTagxNfzU-B=rP3FoZ89_yzy-c=Zw2RQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected


在 2021/4/9 19:58, Sven Van Asbroeck 写道:
> Hello Tian, thank you for the contribution. See below.
>
> On Fri, Apr 9, 2021 at 4:33 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>> Use devm_add_action_or_reset() instead of devres_alloc() and
>> devres_add(), which works the same. This will simplify the
>> code. There is no functional changes.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>   drivers/staging/fieldbus/anybuss/host.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
>> index 549cb7d5..2924e68 100644
>> --- a/drivers/staging/fieldbus/anybuss/host.c
>> +++ b/drivers/staging/fieldbus/anybuss/host.c
>> @@ -1406,7 +1406,7 @@ void anybuss_host_common_remove(struct anybuss_host *host)
>>   }
>>   EXPORT_SYMBOL_GPL(anybuss_host_common_remove);
>>
>> -static void host_release(struct device *dev, void *res)
>> +static void host_release(void *res)
>>   {
>>          struct anybuss_host **dr = res;
> You're expecting a double pointer as the argument here...

What about doing it like this?

diff --git a/drivers/staging/fieldbus/anybuss/host.c 
b/drivers/staging/fieldbus/anybuss/host.c
index 549cb7d5..c97df91 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1406,32 +1406,26 @@ void anybuss_host_common_remove(struct 
anybuss_host *host)
  }
  EXPORT_SYMBOL_GPL(anybuss_host_common_remove);

-static void host_release(struct device *dev, void *res)
+static void host_release(void *res)
  {
-       struct anybuss_host **dr = res;
-
-       anybuss_host_common_remove(*dr);
+       anybuss_host_common_remove(res);
  }

  struct anybuss_host * __must_check
  devm_anybuss_host_common_probe(struct device *dev,
                                const struct anybuss_ops *ops)
  {
-       struct anybuss_host **dr;
         struct anybuss_host *host;
-
-       dr = devres_alloc(host_release, sizeof(struct anybuss_host *),
-                         GFP_KERNEL);
-       if (!dr)
-               return ERR_PTR(-ENOMEM);
+       int ret;

         host = anybuss_host_common_probe(dev, ops);
-       if (IS_ERR(host)) {
-               devres_free(dr);
+       if (IS_ERR(host))
                 return host;
-       }
-       *dr = host;
-       devres_add(dev, dr);
+
+       ret = devm_add_action_or_reset(dev, host_release, host);
+       if (ret)
+               return ERR_PTR(ret);
+
         return host;
  }

>
>> @@ -1417,21 +1417,17 @@ struct anybuss_host * __must_check
>>   devm_anybuss_host_common_probe(struct device *dev,
>>                                 const struct anybuss_ops *ops)
>>   {
>> -       struct anybuss_host **dr;
>>          struct anybuss_host *host;
>> -
>> -       dr = devres_alloc(host_release, sizeof(struct anybuss_host *),
>> -                         GFP_KERNEL);
>> -       if (!dr)
>> -               return ERR_PTR(-ENOMEM);
>> +       int ret;
>>
>>          host = anybuss_host_common_probe(dev, ops);
>> -       if (IS_ERR(host)) {
>> -               devres_free(dr);
>> +       if (IS_ERR(host))
>>                  return host;
>> -       }
>> -       *dr = host;
>> -       devres_add(dev, dr);
>> +
>> +       ret = devm_add_action_or_reset(dev, host_release, host);
> ... yet you pass in a single pointer here. Is that going to work?
>
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>>          return host;
>>   }
>>   EXPORT_SYMBOL_GPL(devm_anybuss_host_common_probe);
>> --
>> 2.7.4
>>
> .
>

