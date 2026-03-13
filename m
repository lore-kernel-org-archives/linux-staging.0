Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3A3CB2C8
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423998; cv=pass; b=XM5VnJ6BvtGWkebP6nGpnjl1SIzrQ4txR7RDbfhlnD+/IvMbQ8aGr0EO7FukZJV+tzcZ8RE1l1spfsyggAuY6ilsvrnU/qFhzD6KbIlCTltwbepsh6fjxT8qR13+4ftqfuZ069evaVRorAbyCfT1I/sBb6Bzx/U45i9PN8ww17A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423998; c=relaxed/simple;
	bh=V3p18Tbg+iWV4KCl9QD+1XD6qLYbhT426dxDQt2dDsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atjKEuATZmFPvC3f+oAyg3cizqdSKSyvcZOtX6k9NVd4BvOh6BronxI/QZirjGho563tRKI9lt/SSsTktuf6g5DNofGFJIgPRx1EsyqHhe36uXoF7BLbUm6o+SbayVExHQE8NK/ktnxmXyIiawoBwwuFe1NFK0Pt9dUB1gJWdYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5aFAyQX; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5aFAyQX"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59de8155501so2448485e87.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 10:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773423995; cv=none;
        d=google.com; s=arc-20240605;
        b=EJf6sJrIDdO/SEb7ZMD1FA9mrTH6xl3MejX2l9XHkYaOFIZzuqDVMXWO+kKSBocn1m
         yPe3wpb9cbQ98+X4ayn6dkoLQLQVmPMrtE0k6wiA7gXPJP/N9FSXXeqxvb31kQG/Bwwy
         o0jGwhPjaozQUUIJ5T4xHlpRAtcVW58HTwfbHcCVOdk5y9OHiWVZ+OElwsh2uM1LgPEG
         od+h33u9fANIHevGfoqCXA+zxxpOB/Ns2PplWzJj1m5obCbExmnxp9pHW5sAYiaOmNQ0
         nqX1ws6Ti/gqj+PfVW2BB2POhJZDLz+cGz4bNQDsfK70+8nfiu6LvIaeBdQ1uR4033NR
         6qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        fh=JxM/VbCgdFFhE8X9kvb2nFfIfAquqtc3xf1YWzDqmKw=;
        b=GOmyx0QHObZwIbSd4MpQvASh87ZtH8b9aIeIW+OOvRx5i/rknNAswT6HlqsMKZxUGR
         DX3bbyj4YXCQtF6HVBb871MxN85MTfmB607VZ+S0GWfCeJxf90veHeP+OtcjwB5h+Aoz
         IYZts4yNSqc8hOJFc/Q1fBdcoZvKdz/wvSGHs3MO/zY2WpT9gAJHfUx7wzOf/Qc1xRWx
         AJ4F2aYDSR9+feinj2qV457qGIcpb1iMO60XUSWJancgj+FtYjiiOh0k8c/fNBoUpp0L
         Oh/xdkciI8/+X/Dg3ECqk100BEWSsSa5LRYyuE9oL9G2xHgmfoOLSyfWbylAvvV7TP5w
         y2Nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773423995; x=1774028795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        b=X5aFAyQXuX1IWwJ4H80x+3E2oqhQs+vvY7zxyXmNXTBYBR0djrtmDNWmQ012LwM2Kh
         5m/4eZ0yLMEDW/WLS9xjOIc2T8v0lvmhV1OIaVCAicC74ATAoeqNOzYhJCzmnqcc3/sx
         baDke114nSeHx5qLdQ2l1oIE/6GLBIp5kptKJmZJQKQ0j9srvDoWrKOVbJleuJ0SYiRI
         kXf1GUT8YXR3tgwOZ+rSeTLmiDcb6UQa4uB+AwaxVQ3U7dc38dFjs0iPEYO23wclIYev
         t9sg3SbZzWSuXqngfijqUCuHK1XudScuBwuTuEt1rNMYep8eR0PrMk1fMU/2pmbnmXk9
         lG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773423995; x=1774028795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        b=OvUn/l8TrfwASh6RYRPqhAgkDjlc2QrjuNeF1s5SECs3ufYYytXxA9vZR3oADH6JPm
         OFnEmVYMPqoSdY3TWFag03Wyg9ptbEfSaAlbpwszZF2zOSnws0qZCF3DvMj2jbmCp3cv
         EmglWzspUgvu2kxOF6+++DvRm/mfipCP21MiZBziLfFDMvD27STLZGuXzLr7xn8PmiJi
         vppf/u28r75r1jmsmUrH5xObgojSR4ZSRpddpTTfF/nlAIZbH9gL2XZQj4vNVIqjEzxi
         xwK07Ch619olOArFBJvVWnQwSPpYNXQazu3vlxdKKJeJMNfEt2qFJaAdgw97e7IryRKP
         zNOA==
X-Forwarded-Encrypted: i=1; AJvYcCVlvbgUykUFFSZ+VGPIG/yHWDb3lsmq5LSQp+pEjKRRjwqeJ9YUz+mlhwXP5mLnDX+3PSzKzOwQ71RtMGIC@lists.linux.dev
X-Gm-Message-State: AOJu0YwinrKcYE5zGTuAgsLaYyumO1Rb34RsEzpZhcH/1i3GCPHk+SjU
	Vy+z7l6YF5dWm/b5SZWewWOqCMyRjsh9kE1FVR8hVDoK2mEMRKO4vqbpLGOMJ6mgTNiFOg0PDVT
	yps+UG912+hq1a+Hc7oujIjZRn1eaBQU=
X-Gm-Gg: ATEYQzxu8+8I+wPamNlyw9PKWUd2MmTVL+7qFQ92PtOxK6T3AELofLvf7zWLuD6jvcF
	JmPWhaXpt88/H+fADR1smYOV2soRVJp4jexnSevAjZyCe+LZ80xiuebgWm+qxKa78ieSC5F79gj
	grCfq/qDK29MHPzgXUtCaDc7N/XhxdukZVJymyvJa5whfXp1kfCPVhudwRAwwil5PasSLlxCZw1
	g40HgtihsfGBHWwo32OJ93f/vOzMSKBB5mChDV4IdkJSl8ghLuvDM8+Prdmwhs1g5JyPe8Dzg2z
	RNc/RIQAwVUluNQuLOfns3M/TstYwBFYeccCUGP9bXOwuuZF3dJu
X-Received: by 2002:a05:6512:606:10b0:5a1:378c:11ea with SMTP id
 2adb3069b0e04-5a162702d43mr1159519e87.13.1773423995156; Fri, 13 Mar 2026
 10:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260313152936.14560-1-starpt.official@gmail.com> <abQ1nYvEpKV-rkL8@ashevche-desk.local>
In-Reply-To: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
From: YuChen Lin <starpt.official@gmail.com>
Date: Sat, 14 Mar 2026 01:46:23 +0800
X-Gm-Features: AaiRm52QUDZVJS0RZgP81bsHau695M_UyBk6fNvQaetPANGLTSp4cIKIGMDbR68
Message-ID: <CAEzaNUQN_KB3n1MsZiU4qdse20VKY84ELWH0e0ZwsxZE_D7=oA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 13, 2026 at 11:29:36PM +0800, Lin YuChen wrote:
> > Replace the open-coded multiplication in kmalloc() with kmalloc_array()
> > to provide overflow protection and improve code readability.
>
> > ---
> > v2:
> >  - Remove unnecessary parentheses in kmalloc_array() call as suggested
> >    by Andy Shevchenko.
>
> This marked as v1 and 2/2, where is the patch 1, and what is v2 here?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hi Andy,

Sorry for the confusion. I made a mistake in the versioning and numbering
while using git format-patch. This was intended to be v2 of the single patc=
h,
but I incorrectly sent it as v1 2/2.

I will send a clean v3 shortly with the correct headers and changelog
to clear this up.

Thanks, Lin YuChen
