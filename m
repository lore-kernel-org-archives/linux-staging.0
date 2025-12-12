Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E03112D3
	for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533045; cv=none; b=ESvaiiHwIiJn1HeQpvtsPM8wXClg+6yfzcjTRXuuHpRjHEuIkbWKS0KMoM83WeWnXtvCGw46Dm4YKnwpW+8sVMsGrKGWlEfN0paHIo4ysssEd7N9793+o73x+AC4ht5vaoGlCf4cy4lZcFm0nynswaDXDUBGi/3fLBFCysLOFWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533045; c=relaxed/simple;
	bh=Q6R7/LJ8zN96Z9uFUAuuFcpse6J/q1bTrJoyH/sft70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLwShePrNpaeHhd7P6bbGdLvIQMoO0BNbuGUb8UJwssy8mSGW/4QjSu/AADu3SEE03lxwd8oNJ0fHWU0clru9jNjJct1Ce+bDOC4vbKBCPpveN2rBW5sKecHf/YgFLCt2FzGOnuYKiId4r7xbjA6/tipASLza9ZtEE1/Xt0wFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOInAzOA; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOInAzOA"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640fc308153so129576d50.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 01:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765533042; x=1766137842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJbqM2O24wxnRn0NUgw4kPPlQVrLrutYAh9dEvpykuo=;
        b=hOInAzOANggJmuvr/3NmWQX6GYM/VBdzvaQqDmlEm9vOJnsfSZBJYw3LrmuPcY3mzi
         PnimJlUWQjbXQOj5n1Lf6qNiNvLuHqbhe8/39M1auasytH7exYdTsEay7Wy/5FAsyFrA
         bTsIm9vYQlai9euMepVOa0u47HIf9seQzQUb8We4+ZYx4Eea/5hCdMXdYUpSElvwtz1I
         fzumBnzlLtb5DEgKw/ft1NDx/p1mmW6zWS70jOoNHCe9vc66CnMRfyaeEs7WwuKX8oMn
         +d+3vtc7qvL9q8ufnJDWbmCz2y2//WvAjJoyJJ2lUTMGPKLuNNrVFaJYsjElcluqtULm
         ZIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765533042; x=1766137842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJbqM2O24wxnRn0NUgw4kPPlQVrLrutYAh9dEvpykuo=;
        b=gED0am2AaFoH5suxNCvswreIggfT+023fUEOwaVr1PcWq7GqnvBvK6piHobkF/gfzh
         ZoT0pOoloRKulnjPEXi29cLBZdiCwMYxo+/jXeRFLO/Pb3kkBHvo3fMhvSiGxuezq02Y
         TEJEDHWjlx9pghazVjy9zmIKBzJ68OCqImADHMI/GdapXAoa/0hu7o6VhzQgXyMP6KMY
         sAVOskNRNeGikt++kD8bbdAYX/jNbtVb+3iufb/a2noE5tqBIxpFqYaV9CkbqQk6WD3E
         W6Mx8tY1StiKkk7cgjRSdEP9AZREnf1UnQEz8+emkUPlwr2jxgAjfUPbZ1tvnC1A6k2O
         vk7w==
X-Forwarded-Encrypted: i=1; AJvYcCWHOnH4aokX9TK7FxJIW8t2qD/Qdf2fxra8NKc04gk2Wo9Zir+GRyDDZ4YrLwqYogbyZ9kcGwLTNC8WV/pj@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhj+7ElAelIqTHtFZqZStjUbfLaejH/i/Wv7rnP3xPZJjdcYlX
	CEJPwHo9sAfGiZ2ePF23AAjIpYI1APfyjfCFBPyKD/LhvbSQ1gHQQ7Zt6aC9R5Og/YpvuXXqUxW
	WVZkEsuX37UWiA2847OMi510TLpK8gCo=
X-Gm-Gg: AY/fxX6nY8QGNZIgwuuBbeSIMnZBMCTfxzggXKuRlo7va52Kb/SBLh6pH9feoW3uC1Y
	C44dD3Z2LSietJe+Ko5fjotV/rXOHEQuKx5VbnFUIyFKtWZaOoYR7cPoqnBWapMNhWNtk0IA/mP
	bnuJ1NOdfhjFsdZPts7LW3OyIVUDvM36SEt1hSfNJD4idFIZarq1nzytLDO7UwgQpkfSoGfvMrj
	WvEeliEzrMO8Hu0nIyGDnH2dYou4wWdoc1PCHIQfZBAodI2y47C98bD3ubiyiZB3jQ2
X-Google-Smtp-Source: AGHT+IEkQw4T7cGHNDMCb6WlmOsv+OiKicIlwgH//zcmfSe6IuSvE8mJjQi9FCFccuFFVDtQsDhNp+0zJIV55FyH4Tg=
X-Received: by 2002:a05:690e:190a:b0:63f:aa52:8994 with SMTP id
 956f58d0204a3-645555ce2c6mr856076d50.1.1765533042456; Fri, 12 Dec 2025
 01:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251212090920.84238-2-giorgitchankvetadze1997@gmail.com> <aTvfHr0E7X4fU6HD@stanley.mountain>
In-Reply-To: <aTvfHr0E7X4fU6HD@stanley.mountain>
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Date: Fri, 12 Dec 2025 13:50:31 +0400
X-Gm-Features: AQt7F2r-ZGAX5rtcRfnn6ZSr5DEuc0fiZmJMxXR7ZCB-Uwx-ylihHHqPrIlFioU
Message-ID: <CAE7dp2qUu3R7y=5Y14ih7Kv54M11FqczpWN--09v9i_iJY5ckA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix memory leaks on rtw_enqueue_cmd() failure
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for catching this. You're absolutely right and I was in the
process of fixing it by the time you mailed me.
The patch is broken due to a workflow error on my side. I made the
code changes first, then tried to fix indentation in a subsequent edit
on the same branch. This caused git to think the if statements already
existed and only show whitespace changes.

The actual intent was to change:
    rtw_enqueue_cmd(pcmdpriv, pcmd_obj);  <<<<<<<<<<<<<< (ORIGINAL )

To:
    if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) =3D=3D _FAIL) {
        kfree(pcmd_obj);
        kfree(pevtcmd);
    }


I will resend v2 from a clean master branch with the changes applied
correctly in a single commit.

Apologies for the noise.

Best regards,
Giorgi

On Fri, Dec 12, 2025 at 1:23=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Dec 12, 2025 at 01:09:21PM +0400, Giorgi Tchankvetadze wrote:
> > Add error handling for rtw_enqueue_cmd() failures in multiple event
> > reporting functions.
> >
> > When rtw_enqueue_cmd() fails to enqueue a command, the allocated memory
> > for the command object and its parameter buffer is not freed, causing
> > memory leaks. Add proper error checks and free the allocated memory on
> > failure in report_survey_event(), report_surveydone_event(),
> > report_join_res(), report_wmm_edca_update(), report_del_sta_event(),
> > report_add_sta_event(), and survey_timer_hdl().
> >
> > Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
>
> What?  The patch is apparently against a tree that doesn't exist and it
> just messes up the indenting.
>
> I've reviewed some of your other emails to LMKL and I'm wondering if
> you're doing AI stuff or something?  What's going on?
>
> regards,
> dan carpenter
>
