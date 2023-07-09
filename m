Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBD7FBFA
	for <linux-staging@lists.linux.dev>; Sun,  9 Jul 2023 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688932566; x=1689537366; i=markus.elfring@web.de;
 bh=eEBUPwxoMMdjDGPWyZwopv4eLqrl5ShKLSL47COW9RE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lbpTn2fwwwHiv1dCnMRMN6oHaAOTZJGqA40XFnaefBYezjhkjucjOM1VQqLJjbRMHaW3YRw
 ZgCoa3ORz50pHVxS9bFB2GuX/5W7iRmwE7t6uNT5GoR6AV4MPqrGj1h9VFp1gTALEzZ+0Aifj
 EJ/ARvQoZcSSZ5Pwmotg3rc2jGnBIx3JkV+8mJoW/H9J7Nt/WbJHoPiLsttN10O14p8pHX5mU
 H6e1YSHFkrJf9QG5POAGQ/c9DVLaHbWgSMv3TWJXjmdrA2T73UNfKs8hyz5lGL3760IpHJDbv
 gecTj/93CLS9YYy+ETvu5AHCsbo1YaO91uHSOJA8igjSzkqtx3YQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ept-1qLbqd0glJ-007pII; Sun, 09
 Jul 2023 21:56:06 +0200
Message-ID: <e24f9c2c-1163-631a-f8c0-b6dcb445a858@web.de>
Date: Sun, 9 Jul 2023 21:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Shurong <zhang_shurong@foxmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>,
 Xu Panda <xu.panda@zte.com.cn>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
 <2023070919-monetary-sleet-2f5c@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2023070919-monetary-sleet-2f5c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1eIZefIf5VyUnpwtQymMX6yS//nJ3XbTQQPBZNXSTUf2J3p4XFb
 zZfjFthRbNtI/Nxgkt+vXLcrH+LzIqAKBXulZahKpgKI5y0Ve+JWLkpVd5yZJoWoS8bn1M3
 Qon9lC0phFNWRUmvf6Us5QviOrdtK7CyofpEJTPUwUI+QXeEYmyTy1pok0Oot5fAPAW6tkj
 2Ae+JpdY21Jck54iXLTRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xLZTuUskxGY=;x/7gtpZBBHNssTtBFSNjfeapmta
 atRfW5rdIOi2+U9YzZWHMIuUFK+Qs0On3j2sYdU/Puuo1taqvtmP5W0Rxquq49XW6eemPhr2U
 wMWQa86Dz0chKbbYpTHcM/B7yd0i5HZ/hgxKfMEf9qYhhOfdXX4XlVp8OqsJJuxCP3C9hc4g2
 lLVh6NLkIeV21sO+upku1Lx7ce4sgPxetW2PXl/pMacS9zYY0pCckBESKtqZSco56udnYDgzi
 AUeooCeWZusZyctKRtPQAi+hsbR5idiMV4o94heC86zp8Rg6V3V8/TTzQuSv1PkcWU++91Ms2
 VUiwu0Dgfg/3Oh+5EbNGACkk1T2JYDFMZSxW4BVvdZylJtekrenPqY+yNdqDgjItc2jDVG+jM
 mhfWvM88j5uYV/jIRsaBDpLikiswJfh71RWVyUlElRHxdaAN7s/6UEjY04Fw68eSAQvuSONaA
 TCtDy5OfySXj9u90pSvpp+fRjuv6oQgnlA2zDTgZISiiDd/B1+no6xDqGq6AJ4cWd2zLmxbhU
 xM27f/Ix0JOmuecD17R4nLI7T3XHVJI3y+i9reXcJGh8Zz6xa4L8hwKTa5oCBSIXxgk1VHhxK
 trfqKtBsyo3bFJbT2FI/DWt2k1L1VdJag6B0U5r5izVrXlP8ExoOIh3xnl7VlVSxwxhGVATs9
 Db7w6A3b/vJM/bIWOQirZg1LVC4xDWAbkHDMxKQgZwRrHyeEz3qIwV7+oPYvU0JvkZQW7FW+s
 4UtmDwbJR8D6NuxBGvrWqcj+REIbKFN0YfoYI7kox+RPfq19zgTlp+46rgMszvyyu5hKOL4WE
 nY1cSxtnY3oFfreOcLevAYAc/WzL38BAMMfjBvX7yY4kJ1bNPvuWJccTqv6aTk65XL7ggBLQ8
 mYtuBVqTUTDdZ4nENfm60DnlGg7BvGl4jSnwypsooRGCq9e/FAzASgcSPJLdckWm+mc6hyeMm
 IYp/0g==

>>> The "exc->key_len" is a u16 that comes from the user.  If it's over
>>> IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.
>>
>> Please choose an imperative change suggestion.
>
> Please stop reviewing staging patches, it is not helpful for anyone.

It seems that further contributors need to become more aware about
(and finally adhere to) requirements from the Linux development documentat=
ion.

Regards,
Markus
