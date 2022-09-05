Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36FF4406
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 14:46:31 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id c3so9033478vsc.6
        for <linux-staging@lists.linux.dev>; Mon, 05 Sep 2022 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YU0FG8NIgWFXTecL+SSdFhlFXIMEHFMnYWxd7GHUf8g=;
        b=ShCU/sqnPmsBQULRc/uE8T/q2ecAZZbN2XZRVNDeqtAskHJ1F5Sg3qwqjs+PYi0OgZ
         fuG8L/1cfvtGXzMhY3RhGK9gmbLALf9U2YmL1sBRdPngaCnZhNM3m/Nih0B6q2Gp519H
         HI7lukhYIxgjmQku6YQs/krNGcmq9cdcQNoDhOGMMpFO0gPvivWSVd2hGYwvm1Eto+8/
         HZ/V1KY4LZZmwE9NhFq+Jk+QdsuUxOJ9bkgcs9fuklJfEy1OkDlTzsbxOctqvBG3yn3e
         94nIYB+e7sgsETzn0pRHDgKVinWFCP3QTBpkMom4iRtu2eiHtH56/H14QKeXpNZZ7o2T
         fVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YU0FG8NIgWFXTecL+SSdFhlFXIMEHFMnYWxd7GHUf8g=;
        b=zjyqEf7/Cm3Bpl2S1VUHbGO34wR+zrrWoVp+VJjz0el4YiI3RL01Tgutf/qIxxyv/b
         XXZxpOqS4UqdfcBYH4xuWjqUlyNjUlFnkDdYL49FljL2+Bf2WYX9E4QIUu+DckyrC+F6
         aRi8y1cMArhLhg+hdElPqUlWWu2WdZ6dRer1sMOyn6WYrskTXHVi6QH3jVaElbfNGM36
         IipTmJiCWBuVXIawtfu404UI2Esx9wb8A6OBdlJZVTC+SjmFu5NzMq5ZlOHg4yxjAYh3
         r4lGLLwVtWekWGuG4cjf7dgtzP2PEVA7RBrIDkrgkneRsuD52BB/6nom3B8HDxRaxwF2
         7Lvg==
X-Gm-Message-State: ACgBeo2wyCJSHX8JY1Ufqlj6ey2728cGa4Jw3UmzdSlB9SS3MET0exh+
	xe9V0NmS7MvYG8k8Bqk8akC66Y28kiE/XI32ThY=
X-Google-Smtp-Source: AA6agR56zvnRJqQJL1/PCtKw2tF69ZR7FNYuXgdpbYFCExZyDgoB6azWhOBZh//ZA37+EuSfYegP3onbI/2zgwOs4ik=
X-Received: by 2002:a67:eecb:0:b0:390:1e6d:fa69 with SMTP id
 o11-20020a67eecb000000b003901e6dfa69mr13809030vsp.52.1662389190555; Mon, 05
 Sep 2022 07:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220905125946.10400-1-guozihua@huawei.com>
In-Reply-To: <20220905125946.10400-1-guozihua@huawei.com>
From: Dan Carpenter <error27@gmail.com>
Date: Mon, 5 Sep 2022 17:46:18 +0300
Message-ID: <CA+_b7DKU+v_dX+kxdHKeEWZJaAh1aFte=dMMSjETHZpjCB5_fQ@mail.gmail.com>
Subject: Re: [PATCH v3] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
To: GUO Zihua <guozihua@huawei.com>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, 
	gregkh@linuxfoundation.org, paskripkin@gmail.com, 
	linux-staging@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000002e91d605e7ef25fa"

--0000000000002e91d605e7ef25fa
Content-Type: text/plain; charset="UTF-8"

[I'm fixing my work email]

On Mon, Sep 5, 2022 at 4:03 PM GUO Zihua <guozihua@huawei.com> wrote:
>
> CFI (Control Flow Integrity) is a safety feature allowing the system to
> detect and react should a potential control flow hijacking occurs. In
> particular, the Forward-Edge CFI protects indirect function calls by
> ensuring the prototype of function that is actually called matches the
> definition of the function hook.
>
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this would get
> cought out by CFI and cause a panic.

Thanks!  This patch needs a Fixes tag because it fixes a crash.

Fixes: cf68fffb66d6 ("add support for Clang CFI")

Ideally Clang would refuse to build known crashy code instead of us waiting
for users to debug things manually.  I have written a Smatch check which
detects this bug.

drivers/staging/r8188eu/os_dep/os_intfs.c:316 (null)() CLANG_CFI
insists types math exactly: 'rtw_xmit_entry'

I'll post the full results from my build tomorrow or later this week.

regards,
dan carpenter

--0000000000002e91d605e7ef25fa
Content-Type: text/x-csrc; charset="US-ASCII"; name="check_enum_cfi.c"
Content-Disposition: attachment; filename="check_enum_cfi.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l7ovimxb0>
X-Attachment-Id: f_l7ovimxb0

LyoKICogQ29weXJpZ2h0IChDKSAyMDIyIFlvdXIgTmFtZS4KICoKICogVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogKiBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQogKiBh
cyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMgogKiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KICoKICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCiAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKICogR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICoKICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKICogYWxvbmcgd2l0aCB0
aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIGh0dHA6Ly93d3cuZ251Lm9yZy9jb3B5bGVmdC9ncGwu
dHh0CiAqLwoKI2luY2x1ZGUgInNtYXRjaC5oIgojaW5jbHVkZSAic21hdGNoX3NsaXN0LmgiCgpz
dGF0aWMgaW50IG15X2lkOwoKc3RhdGljIHN0cnVjdCBzeW1ib2wgKmdldF9lbnVtX3R5cGUoc3Ry
dWN0IGV4cHJlc3Npb24gKmV4cHIpCnsKCXN0cnVjdCBzeW1ib2wgKnR5cGU7CgoJdHlwZSA9IGdl
dF90eXBlKGV4cHIpOwoJaWYgKCF0eXBlIHx8IHR5cGUtPnR5cGUgIT0gU1lNX1BUUikKCQlyZXR1
cm4gTlVMTDsKCgl0eXBlID0gZ2V0X3JlYWxfYmFzZV90eXBlKHR5cGUpOwoJaWYgKCF0eXBlIHx8
IHR5cGUtPnR5cGUgIT0gU1lNX0ZOKQoJCXJldHVybiBOVUxMOwoKCXR5cGUgPSBnZXRfcmVhbF9i
YXNlX3R5cGUodHlwZSk7CglpZiAoIXR5cGUgfHwgdHlwZS0+dHlwZSAhPSBTWU1fRU5VTSkKCQly
ZXR1cm4gTlVMTDsKCglyZXR1cm4gdHlwZTsKfQoKc3RhdGljIGJvb2wgZW51bXNfZXF1aXYoc3Ry
dWN0IHN5bWJvbCAqYSwgc3RydWN0IHN5bWJvbCAqYikKewoJaWYgKCFhICYmICFiKQoJCXJldHVy
biB0cnVlOwoJaWYgKCFhIHx8ICFiKQoJCXJldHVybiBmYWxzZTsKCWlmICghYS0+aWRlbnQgJiYg
IWItPmlkZW50KQoJCXJldHVybiB0eXBlc19lcXVpdihhLCBiKTsKCWlmICghYS0+aWRlbnQgfHwg
IWItPmlkZW50KQoJCXJldHVybiBmYWxzZTsKCXJldHVybiBzdHJjbXAoYS0+aWRlbnQtPm5hbWUs
IGItPmlkZW50LT5uYW1lKSA9PSAwOwp9CgpzdGF0aWMgdm9pZCBtYXRjaF9hc3NpZ24oc3RydWN0
IGV4cHJlc3Npb24gKmV4cHIpCnsKCXN0cnVjdCBzeW1ib2wgKmxlZnQsICpyaWdodDsKCWNoYXIg
Km5hbWU7CgoJbGVmdCA9IGdldF9lbnVtX3R5cGUoZXhwci0+bGVmdCk7CglyaWdodCA9IGdldF9l
bnVtX3R5cGUoZXhwci0+cmlnaHQpOwoJaWYgKGVudW1zX2VxdWl2KGxlZnQsIHJpZ2h0KSkKCQly
ZXR1cm47CgoJbmFtZSA9IGV4cHJfdG9fc3RyKGV4cHItPnJpZ2h0KTsKCXNtX21zZygiQ0xBTkdf
Q0ZJIGluc2lzdHMgdHlwZXMgbWF0aCBleGFjdGx5OiAnJXMnIiwgbmFtZSk7CglmcmVlX3N0cmlu
ZyhuYW1lKTsKfQoKdm9pZCBjaGVja19lbnVtX2NmaShpbnQgaWQpCnsKCW15X2lkID0gaWQ7CgoJ
YWRkX2hvb2soJm1hdGNoX2Fzc2lnbiwgQVNTSUdOTUVOVF9IT09LKTsKCWFkZF9ob29rKCZtYXRj
aF9hc3NpZ24sIEdMT0JBTF9BU1NJR05NRU5UX0hPT0spOwp9Cg==
--0000000000002e91d605e7ef25fa--
