Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2325DA48
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 07:50:51 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWGvH09fxzMn2s;
	Mon, 19 Sep 2022 15:46:03 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:50:42 +0800
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemm600008.china.huawei.com (7.193.23.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:50:42 +0800
Message-ID: <436247c2-1946-af00-7fbf-6d81aac3b640@huawei.com>
Date: Mon, 19 Sep 2022 15:50:41 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH -next] staging: fwserial: Switch to kvfree_rcu() API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <gregkh@linuxfoundation.org>, <ilpo.jarvinen@linux.intel.com>,
	<linux-staging@lists.linux.dev>
References: <20220917024709.5017-1-shangxiaojing@huawei.com>
 <CAHp75VcH_iWh2yaGLzGevKo1a6h5gptdLR8922cd0KvRKnioHQ@mail.gmail.com>
 <48238f57-5bf9-d9f5-8fc9-fb213c98f502@huawei.com>
 <CAHp75Ve7MsiwQu-7Bncd84_u_yNrq1Uhqj84jA_YA5LKT7jvfQ@mail.gmail.com>
From: shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <CAHp75Ve7MsiwQu-7Bncd84_u_yNrq1Uhqj84jA_YA5LKT7jvfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected


On 2022/9/19 15:45, Andy Shevchenko wrote:
> On Mon, Sep 19, 2022 at 4:43 AM shangxiaojing <shangxiaojing@huawei.com> wrote:
>> On 2022/9/17 16:21, Andy Shevchenko wrote:
>>> On Sat, Sep 17, 2022 at 5:12 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:
> ...
>
>>> First of all, this brings even more confusion. Since the below needs
>>> some work, we want to have a v4 with a proper changelog, explaining
>>> also v1 and v3.
>> Ok, I 'll figure out a more clear changelog.
>>
>> Besides, v3 is my miss, please ignore it, next patch will be v2.
> Versioning should go only one direction. You confuse people with your
> versioning schema.

Should I send the sent patch "[PATCH -next v2] staging: fwserial: Switch 
to kfree_rcu() API" again as v4?


Thanks,

Shang XiaoJing

