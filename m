Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDDAD4A
	for <linux-staging@lists.linux.dev>; Fri, 13 Jan 2023 17:38:18 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id v6so1568050ilq.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Jan 2023 09:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T3QluTetdV+YgtL4mtxWKL/SoftBWLzWOCc5IlGFomY=;
        b=S2WWyz9Tl1cu1ltyVU8RkUqPuupNm4osGOLugKoh1pfUm8qbQiyW9cIzOGPDwtMsYi
         Omhq1/WrD5UwtFagU7QdVLcfTifswqCcIZSWIGXei253yC9C7o1Cixnpc1JOb969FrL5
         L4KLBIY1g8B4wc7bPpReUjIU3l+AHN2N57wQBw2lzM43vUGosp0+iG519G5x+jioRSw+
         x68GPCaULSNXWRTKMZ0VvxY3hFbIbuxraGYdIdwJPK2EPLA6pT8iUCUlrbj5YQurX2y4
         bDuuklxpUnb/YE74i+xNdXXIy6enVqBVaspZa91pLYn4Y/pzFoDnb5uQA/j4XHuqsY/h
         ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3QluTetdV+YgtL4mtxWKL/SoftBWLzWOCc5IlGFomY=;
        b=epn/SkYB2MFcir62wP2ShVwlPd6dRgcrYAme/1LWfwcfIv0Gtc+wlXnqgT1JyxjF47
         7fpBWR9f1gm8DcVHEA9VElWre0LSomKlcvHmlzr6Q5XaI+9FK4tcOctuFjK0V5cth7BE
         NU3Kz2oWU+htVCHhhCGEovw0Y1B6n0oVhKIzx38redSBewiCXdfKPTXN0DVLXs0dCqHi
         6imPdA2Rbei0jJ4X/cSlbqldhi8WTQ5Cv4hOvgrYO3ruHdg80eMtCZvP8xo/aw/JgMqQ
         60wMI/JQi5ENWpiBDNfSt+G2v+jeNtpEid5LLFuaFPYlqFsT4uK7l/pAJEQq7FA/cUOO
         Ixhg==
X-Gm-Message-State: AFqh2kpwI+sS3LQST0QwCJCpj4a/kOBOkwrJo7eZ9VP+90hzpn238WGW
	10M1tscaPN1sbkbEZ/+2ivs=
X-Google-Smtp-Source: AMrXdXusUYDmBIZELTgRhWfwRSSOBAsKBIZ5vKDiVVoFs1b0YwGVf9LbIlZjJfTZ3sBeSk/G4fns8A==
X-Received: by 2002:a92:de41:0:b0:30d:71a3:a90c with SMTP id e1-20020a92de41000000b0030d71a3a90cmr24537581ilr.32.1673631497584;
        Fri, 13 Jan 2023 09:38:17 -0800 (PST)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id a91-20020a029464000000b0039ea2dfebb3sm2681620jai.24.2023.01.13.09.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 09:38:17 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Content-Type: multipart/mixed; boundary="------------j7wlTKu34WgdGftaGdn2Aheg"
Message-ID: <d4727587-6a8f-15ce-fa3e-683e104d487a@lwfinger.net>
Date: Fri, 13 Jan 2023 11:38:16 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] staging: r8188eu: Used u16 instead of __le16 in
 rtl8188e_set_FwMediaStatus_cmd()
Content-Language: en-US
To: Gaurav Pathak <gauravpathak129@gmail.com>, paskripkin@gmail.com
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev
References: <20230110135058.21364-1-gauravpathak129@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20230110135058.21364-1-gauravpathak129@gmail.com>

This is a multi-part message in MIME format.
--------------j7wlTKu34WgdGftaGdn2Aheg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/23 07:50, Gaurav Pathak wrote:
> - Changed 2nd argument from __le16 to u16 to fix sparse warning
>    "warning: incorrect type in argument 2 (different base types)"
> - Removed le16_to_cpu() in staging/r8188eu/hal/rtl8188e_cmd.c

The first change was correct; however the second was wrong. The 
FillH2CCmd_88E(adapt() call sends information from the host to the computer on 
the card, which must be little endian, but the argument to the routine is in CPU 
order. See the commit message in the attached patch.

I have no interest in submitting that patch upstream, but you might find it an 
interesting read when you prepare V2 of this patch. Of particular note is that 
even though the semantics were wrong, the previous code worked correctly because 
cpu_to_le16() and le16_to_cpu() both byte swap a 16-bit word and their results 
are the same.

Larry

--------------j7wlTKu34WgdGftaGdn2Aheg
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-staging-r8188eu-Fix-some-endian-problems.patch"
Content-Disposition: attachment;
 filename="0001-staging-r8188eu-Fix-some-endian-problems.patch"
Content-Transfer-Encoding: base64

RnJvbSAxYWE3YjllNWU2YzAyYjQ4Y2MwZTJjNDg3YjliNzkxMjk5OTIxYWYzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBMYXJyeSBGaW5nZXIgPExhcnJ5LkZpbmdlckBsd2Zp
bmdlci5uZXQ+CkRhdGU6IFRodSwgMTIgSmFuIDIwMjMgMjE6Mzg6MTMgLTA2MDAKU3ViamVj
dDogW1BBVENIXSBzdGFnaW5nOiByODE4OGV1OiBGaXggc29tZSBlbmRpYW4gcHJvYmxlbXMK
VG86IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnCkNjOiBwaGlsQHBoaWxwb3R0ZXIuY28u
dWsKClNwYXJzZSBsaXN0cyB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOgoKICBDSEVDSyAgIGRy
aXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWUuYwpkcml2ZXJzL3N0YWdpbmcv
cjgxODhldS9jb3JlL3J0d19tbG1lLmM6MTE5Nzo0OTogd2FybmluZzogaW5jb3JyZWN0IHR5
cGUgaW4KCQkJCQkgYXJndW1lbnQgMiAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCmRyaXZlcnMv
c3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWUuYzoxMTk3OjQ5OiAgICBleHBlY3RlZCBy
ZXN0cmljdGVkCgkJCQkJIF9fbGUxNiBbdXNlcnR5cGVdIG1zdGF0dXNfcnB0CmRyaXZlcnMv
c3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWUuYzoxMTk3OjQ5OiAgICBnb3QgdW5zaWdu
ZWQgc2hvcnQKCQkJCQkgW2Fzc2lnbmVkXSBbdXNlcnR5cGVdIG1lZGlhX3N0YXR1c19ycHQK
ZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvY29yZS9ydHdfbWxtZS5jOjEyNzU6NTc6IHdhcm5p
bmc6IGluY29ycmVjdCB0eXBlIGluCgkJCQkJIGFyZ3VtZW50IDIgKGRpZmZlcmVudCBiYXNl
IHR5cGVzKQpkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19tbG1lLmM6MTI3NTo1
NzogICAgZXhwZWN0ZWQgcmVzdHJpY3RlZAoJCQkJCSBfX2xlMTYgW3VzZXJ0eXBlXSBtc3Rh
dHVzX3JwdApkcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19tbG1lLmM6MTI3NTo1
NzogICAgZ290IHVuc2lnbmVkIHNob3J0CgkJCQkJIFthc3NpZ25lZF0gW3VzZXJ0eXBlXSBt
ZWRpYV9zdGF0dXMKICBDSEVDSyAgIGRyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3
X21sbWVfZXh0LmMKZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvY29yZS9ydHdfbWxtZV9leHQu
Yzo2ODQyOjU4OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZQoJCQkJCSBpbiBhcmd1bWVudCAy
IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvY29yZS9y
dHdfbWxtZV9leHQuYzo2ODQyOjU4OiAgICBleHBlY3RlZCByZXN0cmljdGVkCgkJCQkJIF9f
bGUxNiBbdXNlcnR5cGVdIG1zdGF0dXNfcnB0CmRyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2Nv
cmUvcnR3X21sbWVfZXh0LmM6Njg0Mjo1ODogICAgZ290IHVuc2lnbmVkIHNob3J0CgkJCQkJ
IFthc3NpZ25lZF0gW3VzZXJ0eXBlXSBtZWRpYV9zdGF0dXMKClRoZSBzZWNvbmQgYXJndW1l
bnQgb2YgcnRsODE4OGVfc2V0X0Z3TWVkaWFTdGF0dXNfY21kKCkgbmVlZHMgdG8gYmUgaW4g
Q1BVCm9yZGVyLCBub3QgbGl0dGxlLWVuZGlhbjsgaG93ZXZlciwgd2hlbiBpdCB1c2VzIHRo
YXQgdmFsdWUgdG8gY2FsbApGaWxsSDJDQ21kXzg4RSgpIHRoZSBwYXJhbWV0ZXIgbXVzdCBi
ZSBpbiBsaXR0bGUtZW5kaWFuIG9yZGVyIGFzIHRoYXQKdmFsdWUgd2lsbCBiZSBzZW50IHRv
IHRoZSBmaXJtd2FyZS4gTm90ZSB0aGF0IHRoZSBjb252ZXJzaW9uIGZyb20gTEUgdG8gQ1BV
Cm9yZGVyIHdhcyBsZTE2X3RvX2NwdSgpIHJhdGhlciB0aGFuIHRoZSBjb3JyZWN0IGNwdV90
b19sZTE2LgoKVGhlIGRlZmluaXRpb24gb2YgRmlsbEgyQ0NtZF84OEUoKSBpcyByZXZpc2Vk
LCBhbmQgdGhlIHByb3BlciBjb252ZXJzaW9uCnJvdXRpbmUgaXMgdXNlZC4KCk5vdGUgdGhh
dCB0aGUgb3JpZ2luYWwgY29kZSBwZXJmb3JtZWQgb25lIGJ5dGUgc3dhcCBvbiB0aGUgc2Vj
b25nIGFyZ3VtZW50Cm9mIEZpbGxIMkNDbWRfODhFKCksIGFuZCBnb3QgdGhlIGNvcnJlY3Qg
YW5zd2VyIGV2ZW4gdGhvdWdoIHRoZSBzZW1hbnRpY3MKd2VyZSB2ZXJ5IHdyb25nLgoKU2ln
bmVkLW9mZi1ieTogTGFycnkgRmluZ2VyIDxMYXJyeS5GaW5nZXJAbHdmaW5nZXIubmV0Pgot
LS0KIGRyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2hhbC9ydGw4MTg4ZV9jbWQuYyAgICAgfCA0
ICsrLS0KIGRyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2luY2x1ZGUvcnRsODE4OGVfY21kLmgg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9oYWwvcnRsODE4OGVf
Y21kLmMgYi9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9oYWwvcnRsODE4OGVfY21kLmMKaW5k
ZXggODMxMGQ3ZjUzOTgyLi43ODg5MDRkNDY1NWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9yODE4OGV1L2hhbC9ydGw4MTg4ZV9jbWQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcv
cjgxODhldS9oYWwvcnRsODE4OGVfY21kLmMKQEAgLTE5Myw5ICsxOTMsOSBAQCB2b2lkIHJ0
bDgxODhlX3NldF9Gd1B3ck1vZGVfY21kKHN0cnVjdCBhZGFwdGVyICphZGFwdCwgdTggTW9k
ZSkKIAogfQogCi12b2lkIHJ0bDgxODhlX3NldF9Gd01lZGlhU3RhdHVzX2NtZChzdHJ1Y3Qg
YWRhcHRlciAqYWRhcHQsIF9fbGUxNiBtc3RhdHVzX3JwdCkKK3ZvaWQgcnRsODE4OGVfc2V0
X0Z3TWVkaWFTdGF0dXNfY21kKHN0cnVjdCBhZGFwdGVyICphZGFwdCwgdTE2IG1zdGF0dXNf
cnB0KQogewotCXUxNiBtc3RfcnB0ID0gbGUxNl90b19jcHUobXN0YXR1c19ycHQpOworCV9f
bGUxNiBtc3RfcnB0ID0gY3B1X3RvX2xlMTYobXN0YXR1c19ycHQpOwogCiAJRmlsbEgyQ0Nt
ZF84OEUoYWRhcHQsIEgyQ19DT01fTUVESUFfU1RBVFVTX1JQVCwgc2l6ZW9mKG1zdF9ycHQp
LCAodTggKikmbXN0X3JwdCk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcjgx
ODhldS9pbmNsdWRlL3J0bDgxODhlX2NtZC5oIGIvZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUv
aW5jbHVkZS9ydGw4MTg4ZV9jbWQuaAppbmRleCAxZTAxYzE2NjJmOWEuLmM3ODVjZjhlZDY4
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvaW5jbHVkZS9ydGw4MTg4
ZV9jbWQuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9pbmNsdWRlL3J0bDgxODhl
X2NtZC5oCkBAIC04NSw2ICs4NSw2IEBAIHZvaWQgcnRsODE4OGVfQWRkX1JhdGVBVGlkKHN0
cnVjdCBhZGFwdGVyICpwYWRhcHRlciwgdTMyIGJpdG1hcCwgdTggYXJnLAogdm9pZCBydGw4
MTg4ZV9zZXRfcDJwX3BzX29mZmxvYWRfY21kKHN0cnVjdCBhZGFwdGVyICphZGFwdCwgdTgg
cDJwX3BzX3N0YXRlKTsKIAogdm9pZCBDaGVja0Z3UnN2ZFBhZ2VDb250ZW50KHN0cnVjdCBh
ZGFwdGVyICphZGFwdCk7Ci12b2lkIHJ0bDgxODhlX3NldF9Gd01lZGlhU3RhdHVzX2NtZChz
dHJ1Y3QgYWRhcHRlciAqYWRhcHQsIF9fbGUxNiBtc3RhdHVzX3JwdCk7Cit2b2lkIHJ0bDgx
ODhlX3NldF9Gd01lZGlhU3RhdHVzX2NtZChzdHJ1Y3QgYWRhcHRlciAqYWRhcHQsIHUxNiBt
c3RhdHVzX3JwdCk7CiAKICNlbmRpZi8qIF9fUlRMODE4OEVfQ01EX0hfXyAqLwotLSAKMi4z
OS4wCgo=

--------------j7wlTKu34WgdGftaGdn2Aheg--
