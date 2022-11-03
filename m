Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C929A8
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 19:23:29 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id n186so3044017oih.7
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqziTjxfdQl0fNRtQ4I0OSYSj/ru4qxDbXBeei7oy4s=;
        b=BnyE+BDM7GHsEAGM5bYv3B7xOcr4hDUpNNIG/ujmPbCwgopB8ytsNW48mYGReHAjuO
         2z+ZmXr3SuxLQGENZljdN9QXqxdbyJ7e3PzTyOVtBQWeGfZjfsDEY4JOb+UFx9/iwPuD
         lp0dXMt4zkSopM8MYmpcJHUTts45+pRIhommyG5fzFdtomjRUJlkAuGNVRyaFAx2DS5r
         5Z4VyY0NFmzDDnRToUdHfgdSZXSVKtxaoyHAQQDWX1HQCdKeywVSoRKgFhm5rIy0JAHl
         hiPMOW8I+NEKBVzIno/dGEaBd8bXdmuZWXivk3my0fevn5hNDrL2WweH4LRR0k6Yw+wr
         grYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqziTjxfdQl0fNRtQ4I0OSYSj/ru4qxDbXBeei7oy4s=;
        b=CfsBApiAyYHaC6oorA3hRsbsEbXyjDtMYrtHLrl1U+vGQ2VA5HS9LyytVerIWy19yK
         u4MDWH436+nW/0uy8haIFoIY9YHlL9CfSBYvz9Gb4RX33nMeLV3NBWaG4fJYSS+hJrfH
         GHfebRwiRJ0TLZaRqsIqQCgvow1gyIqZCNXAU5DpyS675o/CfxisSCKc8h2KgqtvFJY8
         yQsCLhO8LUC+Uf76xDsU9yW9FqGFKIzlfQBA5sTVHrGXJN/chl28dwjl4weLyapxk2EU
         JdAeLiizo1f69MlcpJgOP6G7g7kS0UaLZ1kscvotDLZMche2RZ3FQk29cybSykSomQpm
         TSQg==
X-Gm-Message-State: ACrzQf0hJDJXcV/UlRAsmn3NLp1wnKkYi1ETxCbL1hrGOZpVfQoibZRy
	n3DwMxd9V1JncocAa46p9p4=
X-Google-Smtp-Source: AMsMyM6QCfO3tdz6iQo6iPdNduV07dDacddY1xQyOJNkK+T5SSqWUKtlCDMdf1uJAiHhiMSCAGypBw==
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id bh30-20020a056808181e00b0035a59595909mr238097oib.35.1667503408758;
        Thu, 03 Nov 2022 12:23:28 -0700 (PDT)
Received: from [192.168.0.158] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id r3-20020a056870e98300b0013bc40b09dasm790796oao.17.2022.11.03.12.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 12:23:28 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Content-Type: multipart/mixed; boundary="------------jEpg7InBUcZ4C7rHTIpvDrTk"
Message-ID: <fdbd7d7b-7e3f-8343-1dd9-8fd5c167d91d@lwfinger.net>
Date: Thu, 3 Nov 2022 14:23:27 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: staging: rtl8192e: build warning on HZ
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: wlanfae@realtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <a916c06e-a9b5-1cd2-2da7-ac8e46b512c9@infradead.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <a916c06e-a9b5-1cd2-2da7-ac8e46b512c9@infradead.org>

This is a multi-part message in MIME format.
--------------jEpg7InBUcZ4C7rHTIpvDrTk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 13:07, Randy Dunlap wrote:
> FYI:
> 
> When CONFIG_HZ=24 (arch/mips/):
> 
> ../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtl819x_translate_scan':
> ../drivers/staging/rtl8192e/rtllib_wx.c:220:57: warning: division by zero [-Wdiv-by-zero]
>    220 |                       (jiffies - network->last_scanned) / (HZ / 100));
>        |                                                         ^
> In file included from ../include/linux/skbuff.h:45,
>                   from ../include/linux/if_ether.h:19,
>                   from ../include/linux/etherdevice.h:20,
>                   from ../drivers/staging/rtl8192e/rtllib_wx.c:18:
> ../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtllib_wx_get_scan':
> ../drivers/staging/rtl8192e/rtllib_wx.c:261:70: warning: division by zero [-Wdiv-by-zero]
>    261 |                                    (jiffies - network->last_scanned) /
>        |

That statement is messed up. Does the attached patch fix it?


Larry

--------------jEpg7InBUcZ4C7rHTIpvDrTk
Content-Type: text/x-patch; charset=UTF-8; name="test_patch_fr_rtl8192e.patch"
Content-Disposition: attachment; filename="test_patch_fr_rtl8192e.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkyZS9ydGxsaWJfd3guYyBiL2Ry
aXZlcnMvc3RhZ2luZy9ydGw4MTkyZS9ydGxsaWJfd3guYwppbmRleCBkYTJjNDFjOWI5MmYu
LjBhMDA3ZjU1Zjk4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDgxOTJlL3J0
bGxpYl93eC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4MTkyZS9ydGxsaWJfd3guYwpA
QCAtMjE2LDggKzIxNiw4IEBAIHN0YXRpYyBpbmxpbmUgY2hhciAqcnRsODE5eF90cmFuc2xh
dGVfc2NhbihzdHJ1Y3QgcnRsbGliX2RldmljZSAqaWVlZSwKIAlpd2UuY21kID0gSVdFVkNV
U1RPTTsKIAlwID0gY3VzdG9tOwogCXAgKz0gc2NucHJpbnRmKHAsIE1BWF9DVVNUT01fTEVO
IC0gKHAgLSBjdXN0b20pLAotCQkgICAgICAiIExhc3QgYmVhY29uOiAlbHVtcyBhZ28iLAot
CQkgICAgICAoamlmZmllcyAtIG5ldHdvcmstPmxhc3Rfc2Nhbm5lZCkgLyAoSFogLyAxMDAp
KTsKKwkJICAgICAgIiBMYXN0IGJlYWNvbjogJWx1cyBhZ28iLAorCQkgICAgICAoamlmZmll
cyAtIG5ldHdvcmstPmxhc3Rfc2Nhbm5lZCkgLyBIWik7CiAJaXdlLnUuZGF0YS5sZW5ndGgg
PSBwIC0gY3VzdG9tOwogCWlmIChpd2UudS5kYXRhLmxlbmd0aCkKIAkJc3RhcnQgPSBpd2Vf
c3RyZWFtX2FkZF9wb2ludF9yc2woaW5mbywgc3RhcnQsIHN0b3AsCg==

--------------jEpg7InBUcZ4C7rHTIpvDrTk--
