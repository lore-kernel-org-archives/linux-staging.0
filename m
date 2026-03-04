Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD8382F0A
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772656793; cv=pass; b=Fv3yEuM66AFl+BBp5yKCQh449gswEqsyea2d9d2fi075WZ/tiplZkxQWRNYtyfcySkd5ckC+wZrd3Xz3cbDyCw/bYRoh2HlhMRGNUEkSVEkbDB+/L4wZkcoErTvNW6sDwr/YSG5Dm3ap/NaEvD9kVbVE/ELxolGChGd6+g2H+1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772656793; c=relaxed/simple;
	bh=Wi1cZGqu9adlGc2Ytxh/5QKzpNePhNMuEAX/0XQ0lgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwEhkdyugc68ULnahtefzdoZ2H+4EygPXd1zVRq7hdBNQCXwEh5JqG5vYV6nvm0H7C2BmaXXf+FgStKFV3evT7dgIwoXAnxuc6o1kn6MmOIiFVnjOUS4CUuSPajIMEELNEbBWi4czrS6LJ4yIZTqtPjvXUNgEROoWcatp198D+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz0X7MEQ; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz0X7MEQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7382731edfso447329a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 12:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772656791; cv=none;
        d=google.com; s=arc-20240605;
        b=ATbqya48awVK2JhZ7nF1Lzwcqd1RTp+MOp/EtZUe6DD3A1OCXj7GF+hJN63/paEo73
         MdxSmLT6Ew5/jzx0Pyzq4M2VK5r7HA9deuEHTfyxeXeS0J7db9FbaN7KxZuqJQbcom0V
         /6scDejk33b/Zi1JxWNkR3B8NfdVIvzOTZsq3yvenrcJ+5t0MQzAVXQXrGPtxJx2riHG
         0L15TYWrQ6EdzyWevMtDTX7GIY7FrPi8gPKDgQDSDh//h3os13dKjS0j/6O+rYgmOnmG
         ty/Pom0A1e2x6G/rAzRdxlkWIvPGq5IfmV7sArX2VYZe0BrnTm7wL51sPXZSlkFTob0Y
         iDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMKm637PqittVyxATAV+GSRLww/0f9tP+C+4PiTfATQ=;
        fh=hRC8dHANAcwUHsrw54pn0wbVXrORsNDUEgTzj8zwgX4=;
        b=gHxrK4f1991Fiu5ynHljB3adodgyGzUyK5k5oVQb+Hui0xrWlqK1okYRVsU1LgqeP0
         7hydXMP6c1/RGyni/j57RR4N3WM8QnhYTWJZhM3mC2bVGbV58TZU3FChVQo6Fpdjn0v/
         iciEzT24OL3RNdGNFJ95+48YJIh0Pzg/NDPROSz2MDJODRacedTxFokp9GRH4RRJxIhJ
         RTTH/GSqzzuzMdPciYDHnHjLbBWaebFdL24xOZ19sH2kLIfvo6AXld52QlAFPuBhnZjE
         fXIJk+gO1hGp/1Oz/Cpgb2g36ZCpmPssI5hDbIOSzQyP9ILsCFJrIGv4zadXo/DhmtKP
         vw1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772656791; x=1773261591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMKm637PqittVyxATAV+GSRLww/0f9tP+C+4PiTfATQ=;
        b=Cz0X7MEQayO21rgZkrlSEC3ShGl840MxkexE0cFe4gz+YJZzoJVzr1TsC9WwcIUfPl
         rD3+llgDEjqmRis2m51sgwfpBDMDX1QuusnxC/g8/LlX2EG6ON+SZw7XYHR/8qU008c2
         1Oer4wWkmI1IqOCPchKZ8bwQqhU1LOev2lvSfa3G+AIYMytiRIIfm5h/YdW5pV2ezSBd
         OjAMnJUjbXS/UFvoBJpgiS3LjpdGo3ywMRvhkJgISos9ZyODkdOTG/mlJK8/ESO20jMc
         l86HE+nmzeeSpB/MEfDLUhP4/UKzbBZRnzGRrcJAWqc1YxH/8tQYWvxVO/yYBVsvxFjj
         HnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772656791; x=1773261591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMKm637PqittVyxATAV+GSRLww/0f9tP+C+4PiTfATQ=;
        b=HRPkHSxBxaFqqY0XIzji/rDc69Vml5t+Yessy1v6O1vHHQkb28mRfzzBsRnAZm8Qt4
         Chd8pzMndOCQhvyjfo+xPDb6g3jtain+sFp+Cn2ClySRZjs7HFDctm9aDmpq2VQOBBy7
         bA4Loem+Hvo6JAfvRNGQn9j2mHWASTYBXeX0XjnDz0uYUc7J9h3iBaqCB7ROznAXwTLx
         J0yLGbqpWYyjXyAbsgqnNvXXXvykL6ogosciDZg9p+Kf8d6fQy5/ntAzUlsG3df2tnml
         2+b/I8VTwpPfHMbNdV9NolJ26nI5FTm7n5kzavvUkjtf5y8HmGy3Qp0vWthId+zSZaj7
         KxdA==
X-Forwarded-Encrypted: i=1; AJvYcCVThAYU9oZy46ClyxsydEGp3YSnn5yhKPJ0gaHcj9xpjcd9Lor7suvG5tP/7XRTMyxLSuy4AzdU+33x7aL2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1hHP142PsiiYUcAL+IMtKVHPGaKGkMLV0068Ef/BW2yij73YJ
	RX1ZtFc1I/YmEBGHxI/3K+q+lxATx3h/HrzoZIETL6QyGNrN9wxPKyNzmGBpspiLOrW5bs4aVEl
	hJpkULZiK7Yoq71/cEcMT6aXFVN5APjM=
X-Gm-Gg: ATEYQzxfU9spDcu5hTjKRDOAEZ+G06TZDizmS53Vb3vqohiTHt90FTp3QwuGrlbF5TQ
	npfzLQ8938Pt/CK4EIJd7u5JDLWbVAkyVgHqn6GvrvNwUYakqmc0RoxynDeCFT5EEJ6xfd3QKFB
	WUWVUFgDk4IH6F7GWutqYghzSV0Ge/S8UD+dCRnVA37Ej+QGGtLYwdXsqWNnmDWGLpnSiqCBBtr
	1NOSMvA710UrWelJAU4BG5N7jbCN/U9VZvdYD0V68jn+symkO6DzIR3euXTx5k4oV5wWo+NqiSp
	8lDwMQrZetHDSSrQ+ksM/E4rddvcj9k/5HtDcgcxxceJ2VulAG2tTY5k1MxsNpDaFGtNreRdjFq
	OsqWTitA=
X-Received: by 2002:a17:90b:4c4c:b0:34c:2db6:578f with SMTP id
 98e67ed59e1d1-359a6a3c1d2mr2822023a91.19.1772656791445; Wed, 04 Mar 2026
 12:39:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302090803.4796-1-esty5664@gmail.com> <DGSHDT7BCYTC.1TFCJIZHYUB6E@gmail.com>
In-Reply-To: <DGSHDT7BCYTC.1TFCJIZHYUB6E@gmail.com>
From: Esther Zilberberg <esty5664@gmail.com>
Date: Wed, 4 Mar 2026 22:39:39 +0200
X-Gm-Features: AaiRm500ToljJ7cj1zKrh79nIJ6da49ryawnqOU6qn_SAcMntRd8_tAiUrNECXw
Message-ID: <CAPMPFbjpTjwMfK_hawUnF_CmiKPaZ0w6V+f5_NcGVKC4B6UhGg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename supportRateNum to support_rate_num
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, arthur.stupa@gmail.com, jannik@jrehkemper.de, 
	william.hansen.baird@gmail.com, kaizhetan@yahoo.com, s9430939@naver.com, 
	straube.linux@gmail.com, ysinghcin@gmail.com, kees@kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 7:43=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmail.=
com> wrote:
>
> On Mon Mar 2, 2026 at 3:08 AM CST, Esther Zilberberg wrote:
> > Rename supportRateNum to support_rate_num to fix warning
> > reported by checkpatch.pl.
> >
> > Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
> >  2 files changed, 13 insertions(+), 13 deletions(-)
>
> Which branch are you using?
>
> Thanks,
>
> ET
I am using the mainline (master) branch.

Thanks,
Esther
