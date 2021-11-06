Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CBA2C85
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 17:52:23 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c26-20020a9d615a000000b0055bf6efab46so10022412otk.6
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=bF+psvf+6PabKAV+5BQ0NWSnZ8PavZyuo1GfpKAzGIc=;
        b=l0mIBVM0WLMa6lXV9W76LUZ3/N81dBAMTIOZ02IhivCjCbxkOpRnSWHXaigHEK06dO
         cE6j8WsvOWc8EQKviGZrcUTIWFm5CNJnDPpaBWyxt2Fzi2Wa1p4kbm7XmjgHhQtZM7HQ
         8RFhNfQEkqpCgZNiWQeH3aK657O+xIdtdxf7jWlG2GhdR45zqRTZBYW4ba/UmWZmDIRh
         TviRJo+fOB/fWgcwDti+g6NlNKHWb36iRgtiHR31+FfyKBmdk+iKaKzOn3Cz5pUdcYhv
         Cj48vFAjrQci2wlBl0nek+NXF1ZgWhq/vtNqCvLXZGQN8PmwU/JLlTNzpT70ABDI6x3C
         kkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to;
        bh=bF+psvf+6PabKAV+5BQ0NWSnZ8PavZyuo1GfpKAzGIc=;
        b=j5/MI/tHsH2BvDQ/Ji6F9zMoTvXkWkaV+j7M5rqLjONXQyy3gyWZ/aTrH+UlSYiQOs
         G+dk/MitSzCXLBvpC2kpdDzTP4KTp2waDHrA22x1Vs0w10WhBXrougeHhF6sepwGrffD
         zY09RUNRPZzFfG+Yr6k+AB71vDSHhzg3hdZ/AjJrYYxYdjXW18Px/OUsLsb0kOerLT96
         P/BOPoMHz4jsbQM4L1rBRfUGf8yRovjy2Fj1cgtAckvw5MH8CRQAQifkv9jTuouFF7Fs
         cssH+AA8itvo+mAy9FHYnUM0W0PDHtuysrqFBksaRfLbo1u7oBAtYJ+y+WMTmwhixA45
         TCpQ==
X-Gm-Message-State: AOAM532ZFQYGqjJnMG/31EPprwVnr2J/bOr6LLp+9YBq5IH4xw/9TNhv
	JNKe8cfIjCTjV91ox1Scs1s=
X-Google-Smtp-Source: ABdhPJzDpADLPyXjw4rpgWuHazeJpPCJnKoLvMrRcM2PYcsNCipsx5Nr8kbgVlq6ROSyem4wNKJrkQ==
X-Received: by 2002:a9d:7ad2:: with SMTP id m18mr20185010otn.49.1636221142463;
        Sat, 06 Nov 2021 10:52:22 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1025? (2603-8090-2005-39b3-0000-0000-0000-1025.res6.spectrum.com. [2603:8090:2005:39b3::1025])
        by smtp.gmail.com with ESMTPSA id w12sm3629187oop.19.2021.11.06.10.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 10:52:21 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Content-Type: multipart/mixed; boundary="------------3pebdOwWmL0FGTe03Fcnp0vI"
Message-ID: <627d77ea-a5f3-b3c6-a731-c5a0c472b4bf@lwfinger.net>
Date: Sat, 6 Nov 2021 12:52:20 -0500
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
--------------3pebdOwWmL0FGTe03Fcnp0vI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Zameer,

Of course I missed one. Please try version 2 of the patch.

Thanks,

Larry

--------------3pebdOwWmL0FGTe03Fcnp0vI
Content-Type: text/x-patch; charset=UTF-8; name="test_patch2.patch"
Content-Disposition: attachment; filename="test_patch2.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1L2NvcmUvcnR3X21sbWVfZXh0
LmMgYi9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9jb3JlL3J0d19tbG1lX2V4dC5jCmluZGV4
IDU1YzNkNGE2ZmFlYi4uZDM4MTQxNzRlMDhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdp
bmcvcjgxODhldS9jb3JlL3J0d19tbG1lX2V4dC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9y
ODE4OGV1L2NvcmUvcnR3X21sbWVfZXh0LmMKQEAgLTEwNyw2ICsxMDcsNyBAQCBzdGF0aWMg
c3RydWN0IHJ0X2NoYW5uZWxfcGxhbl9tYXAJUlRXX0NoYW5uZWxQbGFuTWFwW1JUX0NIQU5O
RUxfRE9NQUlOX01BWF0gPSB7CiAJezB4MDF9LAkvKiAweDEwLCBSVF9DSEFOTkVMX0RPTUFJ
Tl9KQVBBTiAqLwogCXsweDAyfSwJLyogMHgxMSwgUlRfQ0hBTk5FTF9ET01BSU5fRkNDX05P
X0RGUyAqLwogCXsweDAxfSwJLyogMHgxMiwgUlRfQ0hBTk5FTF9ET01BSU5fSkFQQU5fTk9f
REZTICovCisJKDB4MDApLCAvKiAweDEzICovCiAJezB4MDJ9LAkvKiAweDE0LCBSVF9DSEFO
TkVMX0RPTUFJTl9UQUlXQU5fTk9fREZTICovCiAJezB4MDB9LAkvKiAweDE1LCBSVF9DSEFO
TkVMX0RPTUFJTl9FVFNJX05PX0RGUyAqLwogCXsweDAwfSwJLyogMHgxNiwgUlRfQ0hBTk5F
TF9ET01BSU5fS09SRUFfTk9fREZTICovCkBAIC0xMTgsNiArMTE5LDcgQEAgc3RhdGljIHN0
cnVjdCBydF9jaGFubmVsX3BsYW5fbWFwCVJUV19DaGFubmVsUGxhbk1hcFtSVF9DSEFOTkVM
X0RPTUFJTl9NQVhdID0gewogCXsweDAwfSwJLyogMHgxQywgKi8KIAl7MHgwMH0sCS8qIDB4
MUQsICovCiAJezB4MDB9LAkvKiAweDFFLCAqLworCXsweDAwfSwJLyogMHgxRiwgKi8KIAkv
KiAgMHgyMCB+IDB4N0YgLCBOZXcgRGVmaW5lID09PT09ICovCiAJezB4MDB9LAkvKiAweDIw
LCBSVF9DSEFOTkVMX0RPTUFJTl9XT1JMRF9OVUxMICovCiAJezB4MDF9LAkvKiAweDIxLCBS
VF9DSEFOTkVMX0RPTUFJTl9FVFNJMV9OVUxMICovCg==
--------------3pebdOwWmL0FGTe03Fcnp0vI--

