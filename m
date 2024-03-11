Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6053807;
	Mon, 11 Mar 2024 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710192869; cv=none; b=Z1/AMWqOgdjzSPvrXPNBaH4l8O8HjCI/13xeyZDsjV/uRnMMALUtELVc3gXtCbi+PZzGUeg3Ne4764Z7sL1e3jTh0iOAI38Qnoyvw/Z2l17rNGOEI5J9hT9hzSN5T5iP3wmp12K+tFA3OQcDzQgm8cjW2aCxXKpv3XourBoGu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710192869; c=relaxed/simple;
	bh=uzQhki3TZLwS9pRJVIDLPEOGmIH8pLGWj8nfm3LeQTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8ROFBcWyqXJAm823mLf25WYhsd2otH7iGtfxOH2CV5+DK3E2bNsbsieH4JYSR9HNlp/yAv9ROSFEfrTnBb7TDaHZMQ5XO7KNni3/7RLcxtLqtzr0wtFl+s0dlnXOnHW4PmlslJrsEXpYP4+RmT0f+MPHc6iIlZYEAYIXKD6SD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gxw2hTQF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gxw2hTQF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413183f5e11so19811055e9.1;
        Mon, 11 Mar 2024 14:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710192865; x=1710797665; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoyPbLE8gmCKUzlWjn5/O0DOw7C9hT1ZPXAyBMqR3Fc=;
        b=Gxw2hTQFpqPlfehSzUSjIeZjVYkTugEyUTLevgKwG18ZzjhsgXjzM2rRbNk1Y0Nfef
         rtSwPhkx6ojqI6/78YMSG1NqWZVaNhB2CbZ/myDF4yHYRAj/BcRGds00z6yl7z23He2j
         WpVN98u8c+c2FETmh1ioo68nqv+doDhLcG2sMvd3wMGHjqdlp1d+Uf77xTfQkmLxYqx2
         sTY58T3fUV3VtoTZI1Ohj3v2eKI8ZoBn7s48eCgvI2vow/B9+Xq7gjaCjKniNEQt+bnG
         jFDQkGqcjKsysEE7XzbNiuMWIO6E/OIUGK5GSJT/Lo86X3JIJi5soAk1JMbNbfmmyy02
         zDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710192865; x=1710797665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoyPbLE8gmCKUzlWjn5/O0DOw7C9hT1ZPXAyBMqR3Fc=;
        b=wBu6Lwf6ve6Z1lXnN01Gy94Gi4/18vhZA2bYfbKBzjMPFYQWsOYKYfyUOCmCDqJ4vl
         WJYRPV8lyu47ZRZQj9A/7pKoK/+L9x1IuvoA5UPI2Szos1FxeBcPyHsHZiqeJshqgms3
         jBOkpV9f+q1ZXWp6Deu85tV2oGrX3yLxkPFGZeylpMiCIgbKYz9Hjd1gMUZHB33bkqfP
         g+V1I2HMdKXj2YnqQDUGReKjdP7hXI6ixCIfKP0ciP0cJxhhm5XXm7F1q+7C8WxUsHJf
         AUCZ+RFuTJ2mtUNVxhfcvISQq1lkdS+wYPRJhWU9f6RW0whQ9NOgqvQKApMBdh+S5kQg
         BaAg==
X-Forwarded-Encrypted: i=1; AJvYcCWu0jjQjoNVtaQOGOgA3SzcvQGi2ZFH5rppaB49Dj5XZAfsmEkfGoE/aUdhQkySJoaYdBEzF9ohbHFWvJPQeUZNKawhqWGwSonnK2pmPA==
X-Gm-Message-State: AOJu0YwsPMaZXiv960FVoc2AL/99Sl7YCIa8BdSpYry/W/zvg9txSDmb
	WqOHx7u5h+5ppV+b7peQN//m1C+oHHg5LWjiUt2jZMyW0ss9Lr78
X-Google-Smtp-Source: AGHT+IHeTsmiGAFRaMFvRUX0CuqRYgUclChkh7JV2jlmIrvs043PuYKtImihvBvshPA85fGUgQwnbg==
X-Received: by 2002:a05:600c:35c8:b0:413:1619:a78 with SMTP id r8-20020a05600c35c800b0041316190a78mr7101556wmq.4.1710192865153;
        Mon, 11 Mar 2024 14:34:25 -0700 (PDT)
Received: from [192.168.1.101] ([129.0.78.235])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b00412a31d2e2asm10416778wmq.32.2024.03.11.14.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 14:34:24 -0700 (PDT)
Message-ID: <b9cc75d2-3e06-43d6-8b70-38d1c97124d2@gmail.com>
Date: Mon, 11 Mar 2024 22:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: wlan-ng: p80211conv: fix indentation
 problems, introduced by previous commit
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
References: <Ze9Ie67PCSvBU+og@MOLeToid>
 <6d643351-8924-4c86-9fb5-9951e016f5db@gmail.com>
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
In-Reply-To: <6d643351-8924-4c86-9fb5-9951e016f5db@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thank for you the feedback Philipp, I have checked

and corrected the checkpatch warnings.


Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
  drivers/staging/wlan-ng/p80211conv.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c 
b/drivers/staging/wlan-ng/p80211conv.c
index a0413928a843..e48a80df87a6 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -186,9 +186,9 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, 
u32 ethconv,
          if (!p80211_wep->data)
              return -ENOMEM;
          decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
-                                      skb->len,
-                                    wlandev->hostwep & 
HOSTWEP_DEFAULTKEY_MASK,
-                                    p80211_wep->iv, p80211_wep->icv);
+                        skb->len,
+                        wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
+                        p80211_wep->iv, p80211_wep->icv);
          if (decrypt_check) {
              netdev_warn(wlandev->netdev,
                      "Host en-WEP failed, dropping frame (%d).\n",
@@ -306,10 +306,10 @@ int skb_p80211_to_ether(struct wlandevice 
*wlandev, u32 ethconv,
              return 1;
          }
          decrypt_check = wep_decrypt(wlandev, skb->data + 
payload_offset + 4,
-                                    payload_length - 8, -1,
-                                    skb->data + payload_offset,
-                                    skb->data + payload_offset +
-                                    payload_length - 4);
+                        payload_length - 8, -1,
+                        skb->data + payload_offset,
+                        skb->data + payload_offset +
+                        payload_length - 4);
          if (decrypt_check) {
              /* de-wep failed, drop skb. */
              netdev_dbg(netdev, "Host de-WEP failed, dropping frame 
(%d).\n",
-- 
2.34.1

On 3/11/24 20:31, Philipp Hortmann wrote:
> On 3/11/24 19:07, Felix N. Kimbu wrote:
>> This change renames the local variable foo to decrypt_check in functions
>> skb_ether_to_p80211(...) and skb_p80211_to_ether(...), giving intuitive
>> meaning to the identifier.
>>
>> It also indents the parameters to match the the opening parentheses.
>>
>> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
>
> Hi Felix,
>
> I think the subject names the subsystem "staging" and then the driver 
> which is "wlan-ng" the file can follow but you cannot omit the driver 
> name.
>
>
> Please check the following checkpatch warnings:
> File Nr: 0    Patch: ../../../Downloads/20240311-[PATCH] staging_ 
> p80211conv_ Rename local foo to decrypt_check-15036.txt
> WARNING: Possible repeated word: 'the'
> #11:
> It also indents the parameters to match the the opening parentheses.
>
> ERROR: code indent should use tabs where possible
> #41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
> +^I^I^I^I  ^I^I^I^I^Iskb->len,$
>
> WARNING: please, no space before tabs
> #41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
> +^I^I^I^I  ^I^I^I^I^Iskb->len,$
>
> CHECK: Alignment should match open parenthesis
> #41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
> +        decrypt_check = wep_encrypt(wlandev, skb->data, 
> p80211_wep->data,
> +                                      skb->len,
>
> WARNING: line length of 115 exceeds 100 columns
> #42: FILE: drivers/staging/wlan-ng/p80211conv.c:190:
> +                                    wlandev->hostwep & 
> HOSTWEP_DEFAULTKEY_MASK,
>
> WARNING: line length of 105 exceeds 100 columns
> #43: FILE: drivers/staging/wlan-ng/p80211conv.c:191:
> +                                    p80211_wep->iv, p80211_wep->icv);
>
> CHECK: Alignment should match open parenthesis
> #72: FILE: drivers/staging/wlan-ng/p80211conv.c:309:
> +        decrypt_check = wep_decrypt(wlandev, skb->data + 
> payload_offset + 4,
> +                                    payload_length - 8, -1,
>
> total: 1 errors, 4 warnings, 2 checks, 58 lines checked
>
> Thanks for your support.
>
> Bye Philipp
>
>
>> ---
>>   drivers/staging/wlan-ng/p80211conv.c | 30 ++++++++++++++--------------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/staging/wlan-ng/p80211conv.c 
>> b/drivers/staging/wlan-ng/p80211conv.c
>> index 8336435eccc2..a0413928a843 100644
>> --- a/drivers/staging/wlan-ng/p80211conv.c
>> +++ b/drivers/staging/wlan-ng/p80211conv.c
>> @@ -93,7 +93,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, 
>> u32 ethconv,
>>       struct wlan_ethhdr e_hdr;
>>       struct wlan_llc *e_llc;
>>       struct wlan_snap *e_snap;
>> -    int foo;
>> +    int decrypt_check;
>>         memcpy(&e_hdr, skb->data, sizeof(e_hdr));
>>   @@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice 
>> *wlandev, u32 ethconv,
>>           p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
>>           if (!p80211_wep->data)
>>               return -ENOMEM;
>> -        foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
>> -                  skb->len,
>> -                  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
>> -                  p80211_wep->iv, p80211_wep->icv);
>> -        if (foo) {
>> +        decrypt_check = wep_encrypt(wlandev, skb->data, 
>> p80211_wep->data,
>> +                                      skb->len,
>> +                                    wlandev->hostwep & 
>> HOSTWEP_DEFAULTKEY_MASK,
>> +                                    p80211_wep->iv, p80211_wep->icv);
>> +        if (decrypt_check) {
>>               netdev_warn(wlandev->netdev,
>>                       "Host en-WEP failed, dropping frame (%d).\n",
>> -                    foo);
>> +                    decrypt_check);
>>               kfree(p80211_wep->data);
>>               return 2;
>>           }
>> @@ -265,7 +265,7 @@ int skb_p80211_to_ether(struct wlandevice 
>> *wlandev, u32 ethconv,
>>       struct wlan_llc *e_llc;
>>       struct wlan_snap *e_snap;
>>   -    int foo;
>> +    int decrypt_check;
>>         payload_length = skb->len - WLAN_HDR_A3_LEN - WLAN_CRC_LEN;
>>       payload_offset = WLAN_HDR_A3_LEN;
>> @@ -305,15 +305,15 @@ int skb_p80211_to_ether(struct wlandevice 
>> *wlandev, u32 ethconv,
>>                      "WEP frame too short (%u).\n", skb->len);
>>               return 1;
>>           }
>> -        foo = wep_decrypt(wlandev, skb->data + payload_offset + 4,
>> -                  payload_length - 8, -1,
>> -                  skb->data + payload_offset,
>> -                  skb->data + payload_offset +
>> -                  payload_length - 4);
>> -        if (foo) {
>> +        decrypt_check = wep_decrypt(wlandev, skb->data + 
>> payload_offset + 4,
>> +                                    payload_length - 8, -1,
>> +                                    skb->data + payload_offset,
>> +                                    skb->data + payload_offset +
>> +                                    payload_length - 4);
>> +        if (decrypt_check) {
>>               /* de-wep failed, drop skb. */
>>               netdev_dbg(netdev, "Host de-WEP failed, dropping frame 
>> (%d).\n",
>> -                   foo);
>> +                   decrypt_check);
>>               wlandev->rx.decrypt_err++;
>>               return 2;
>>           }
>
