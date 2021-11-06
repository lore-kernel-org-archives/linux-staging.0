Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA3E2C85
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 17:44:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s139so3011988oie.13
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=Dim174x4ER+IfniuqfjMzRQHyA8JPONtFaYfiru+u10=;
        b=axbNQXV/yk5rcJKn7mtxxpEzYdey8ivU1TUBYeA6De/zWDqwWswHhiBkvxPsxXU+VX
         CB7iT+4/Df+CoilXwpkvNDOHYvSNVjaPQR8vltq0yJd4+JutM7ECm5aUspmEE+Y6AdLx
         SYgXjEWinyMQlX9ShwNFGjqZH6mLbBqSPO+tqN0G6h+he+KqiIS/SZ3plZHPYTLADayh
         F+oH5IP8pd+SaHo28o8pGLLi1yaPTsduAFplZCpq0t7eAhOfFB0dQFuYXbCyENMUbl4+
         fjffL1unDyrk1MD/7KbWOdy2yrAJPog4DQIeAlbNf1T/1wIRGMDtP8yIUPOg9Sv9ZazX
         Bc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to;
        bh=Dim174x4ER+IfniuqfjMzRQHyA8JPONtFaYfiru+u10=;
        b=LWQteV41XLYXdIj7Vcr9HC2VAK1qHth2bme9rncUqym3S0dqZ6dmbq8W3+litxNg6t
         QrdT6A/0Zfkn+7CQYOwxGt4ZRxQz+5wiXEG08YQ/djKtTn05kvE+YT0MxTjWxFOWFMka
         +ujhxZ4ZbhZvEp2YYbN3WCtHhGtByRoYFPPsocC43I8wr5dDGK2maWWAslmj6HZ1/FxZ
         gEREMSCF2iYiYxh3Kly0xyrgoXg3nLA5K1YZCnMGdO+3vovjyyR1wZX+4dpdsppcBfSh
         aULZmm57q4egWk4OexJBjg8cD8c1IC0bV4CPSJhJRG1N1vbLzz6WsJXUNZZsv+wtRfaX
         E2Fw==
X-Gm-Message-State: AOAM531SpEPiX/McA0hBsUKgcMHBIA6496e6puNPzTJ5Oqwl6OMpWQzD
	0d/1S6jJaxA3pjgAImT/1nQ=
X-Google-Smtp-Source: ABdhPJxdT+XlwcDE3dpB+CWzUp4jdKekwC9Iu95lh6rNLt1lqjECk1wr+BoP/+pAB2Smb9ux7MQQtw==
X-Received: by 2002:aca:90e:: with SMTP id 14mr29179075oij.170.1636220653851;
        Sat, 06 Nov 2021 10:44:13 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1025? (2603-8090-2005-39b3-0000-0000-0000-1025.res6.spectrum.com. [2603:8090:2005:39b3::1025])
        by smtp.gmail.com with ESMTPSA id t27sm3246237otr.8.2021.11.06.10.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 10:44:12 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Content-Type: multipart/mixed; boundary="------------BxVab9KDSPY3VmzsjWPgblUt"
Message-ID: <0ffaa68b-76d0-0fbc-a11a-65f7cd07cb0d@lwfinger.net>
Date: Sat, 6 Nov 2021 12:44:11 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>

This is a multi-part message in MIME format.
--------------BxVab9KDSPY3VmzsjWPgblUt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 10:48, Zameer Manji wrote:
> Hello All,
> 
> I have bisected the regression to
> ```
> commit 221abd4d478ab52fd17de9287fa302ac0e06f7b3
> Author: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Date:   Thu Aug 12 02:25:19 2021 +0200
> 
>      staging: r8188eu: Remove no more necessary definitions and code
> ```
> 
> Prior to this change the device can see all networks on all channels.
> With this change, the device can only see networks on channel 11.
> I suspect this might be specific to the RTL8188EUS variant
> of the hardware. Unfortunately I don't know enough about
> this driver or the hardware to understand where the issue
> is in the change.

Zameer,

No this problem is not due to the EUS variant. In fact, I have one of those, and 
I suspect most users do.

Thanks again for the bisection, which is most helpful. I have identified what I 
think is a problem with the offending patch. An entry was removed from one of 
the tables when it should have been replaced with a zero value in that location. 
Attached is a patch for testing. Please apply it and report your results. 
Meanwhile, I will look to verify that there are no other similar problems.

Thanks,

Larry
--------------BxVab9KDSPY3VmzsjWPgblUt
Content-Type: text/x-patch; charset=UTF-8; name="test_patch.patch"
Content-Disposition: attachment; filename="test_patch.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWVfZXh0
LmMgYi9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19tbG1lX2V4dC5jCmluZGV4
IDU1YzNkNGE2ZmFlYi4uZjVjOWE2NDVjNjgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdp
bmcvcjgxODhldS9jb3JlL3J0d19tbG1lX2V4dC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9y
ODE4OGV1L2NvcmUvcnR3X21sbWVfZXh0LmMKQEAgLTEwNyw2ICsxMDcsNyBAQCBzdGF0aWMg
c3RydWN0IHJ0X2NoYW5uZWxfcGxhbl9tYXAJUlRXX0NoYW5uZWxQbGFuTWFwW1JUX0NIQU5O
RUxfRE9NQUlOX01BWF0gPSB7CiAJezB4MDF9LAkvKiAweDEwLCBSVF9DSEFOTkVMX0RPTUFJ
Tl9KQVBBTiAqLwogCXsweDAyfSwJLyogMHgxMSwgUlRfQ0hBTk5FTF9ET01BSU5fRkNDX05P
X0RGUyAqLwogCXsweDAxfSwJLyogMHgxMiwgUlRfQ0hBTk5FTF9ET01BSU5fSkFQQU5fTk9f
REZTICovCisJKDB4MDApLCAvKiAweDEzICovCiAJezB4MDJ9LAkvKiAweDE0LCBSVF9DSEFO
TkVMX0RPTUFJTl9UQUlXQU5fTk9fREZTICovCiAJezB4MDB9LAkvKiAweDE1LCBSVF9DSEFO
TkVMX0RPTUFJTl9FVFNJX05PX0RGUyAqLwogCXsweDAwfSwJLyogMHgxNiwgUlRfQ0hBTk5F
TF9ET01BSU5fS09SRUFfTk9fREZTICovCg==
--------------BxVab9KDSPY3VmzsjWPgblUt--

