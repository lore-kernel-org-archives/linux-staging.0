Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B251B198
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868561; cv=none; b=e+qZs4wDb2Z10nI8YBH2w+hLtV1Eu7xT41zby1dcfUrDlq+IQ1STQncy6FanrT0hl+85bgtZ7FNzOcK5skZnx1Y3otv/UVXguynECiZogJsrxJaYu4nKBL6u/Y+ECqftNvwkaVmmsjhjvEdymZHA6IPKthhsdPNaNYZkREY/i/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868561; c=relaxed/simple;
	bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=m5BuwDeed+4EC3LPMWjWQ3dPrHY5ktMMpSGSx+oH/YCbRQDMwnlyPx9zGC8slEBSHHEEC16CzHuM0HQs6LK32Sz09TMgLd6kQCLhsXQCIsujm3h/CPFVA96JuDIW57u2YFHICze+A8CQ6nrnWCZBwYQP75Ivx6K8+OkkVQms4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etc9Cggb; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etc9Cggb"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso2506804a91.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790868559; x=1791473359; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
        b=Etc9Cggbt0vERYDJmSf3kpM2MwluNjQtRfQpNYeoovBu+06QFK7qs+2tBeJcRPiKxf
         nqVnN6WX8BHjHqYFL7G6fKa7FzgyPoBDgv4HadoHOCSEv7LbGhoR75/utrzYPcgjhYMK
         hBzoA/LSZLK2nIyk+KLUCZuBpnUhSfadeu2DtwYVvcxjIJRNPZfGrCeSoVzdwNkvAJcv
         bQHiwiCLsfTFJpPYpM4fDD/oCKo9jOtP1Bn4E46Fp9j1tq3Dxt5FeT5K9sH7k3WYJC/V
         scKJnUpRCf+kwhHJkTxTWR6M6HsMIU9ElXewuOSUMa/epwEjoZ/iZAsDYAOpNLnjlA5h
         NVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868559; x=1791473359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNcNJn3X5W7lsJlCgei7UshAShBrSRSwp4FU4T+SZoc=;
        b=WCM3NhQOfW5j1BRTIi3GGPzSiJLh9hDRch8xY0Ei9nfyMml5toG8aQnN58Bd8MeC03
         eSTbiKGwriLbmLAb7vURKY+pVvtqm+i5mMvDiEP1vbmGYPrKXH1eYj1fj9R2M+Qh6p7z
         W9JXfWXn295sYhe10LxiezAdMJvrpWCPc9LKMxz6hHUAN+N8YeIXP5CP9w+ySynrXQzR
         7GLajEp0HiTKMbEttG90hIO8CBNRMeRbPJUGSRTxrwP6qS3wpF6dWKGzvtSXaLFaEApL
         Sr6NapcAjnMEc6Wac/T7sr5sfOAcmM8PhE9yewf2Z2KUgx8geERPpdJ4ej7e5fBVWR6s
         G8zQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5k1iNf/FqUQ2xfj35ADZWtlhd0T9ZGygdol6fvt2XfXrSGOkJmGMMeGYa0O+99tDKsEb+cx33jAuMq7pd@lists.linux.dev
X-Gm-Message-State: AFq9FYJewkK8hXiQu+KpZKL3BSjeoHMKu8o3USUEHVxhoAqjBpdUGNxp
	nsq6LDq/81eMp2ykdRwtDPev217dXUz000nn9P1VnX+y+m5GQqHMBbuz
X-Gm-Gg: AYBFou09SDf1ROy/zdeN6LUpewLzvoAiqfozH6OWw4pOITf8w6xxiwzBhYUAaavyxRE
	W3Ck9nDGmZwYMhGjbEUTfTB/3oRAPLXXXdnh2d1jmbjvwZWMk2qxg3bZbMTbYwS6V3tsKaom8zB
	RCLY/JbEXbNxDPMlJYnGcTEzrE7zsrIJujTY6Zm2XAATSFYniecsvrBJdyAeV//W6GsscrLuCac
	LqEme8SrwAlD9tNDA+mk50C1yiKZh1frl7RATPz5LlDiL/C6zdhajdDXSNtYjQcwqIm3luNnM2a
	H9+YzB9Brl805yOzaR42PNCEGZhKwVuhEOkxzUlp7Uq33rcbqwUIn7Pw67c0rNIpU7KpEsXVQhY
	vUIcAEPiSKowowPqxZ/E5DwIO9UdgxiDdY/nT9r4tRdeQZmyWR/3NENCFN5cqv3Hppr4oToWMfd
	Fb2QL+r14A58ZDoNjeTAMIKdUSye3X0AqqNGBBRI8HYUc+pGx2tpQg2suSzui+SMLhAYmUs+4Dy
	OLVdxrVggHdXog=
X-Received: by 2002:a17:90b:5787:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a50364340fmr1885074a91.31.1790868559126;
        Thu, 01 Oct 2026 08:29:19 -0700 (PDT)
Received: from smtpclient.apple ([5.34.220.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f75a7f87sm1694927a91.3.2026.10.01.08.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:29:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
From: Eric Lee <eric.lee0305@gmail.com>
In-Reply-To: <2026100121-chirpy-stomp-9fbe@gregkh>
Date: Thu, 1 Oct 2026 23:28:57 +0800
Cc: Hungyu Lin <dennylin0707@gmail.com>,
 Andrei Khomenkov <khomenkov@mailbox.org>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 Ethan Tidmore <ethantidmore06@gmail.com>,
 Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
 SeungJu Cheon <suunj1331@gmail.com>,
 Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
 Jennifer Guo <guojy.bj@gmail.com>,
 linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Eric LI (Honggang)" <eric.lee0305@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4EEF5A3-75CF-4A4B-98CB-2EDEE2223C81@gmail.com>
References: <20260924151606.333467-1-eric.lee0305@gmail.com>
 <2026100121-chirpy-stomp-9fbe@gregkh>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> Refactor it how?

The previous code handled two cases in one branch
- pxmitbuf is null, or
- pxmitbuf is not null, but is not enough for current pframe.

That causes an additional check of pxmitbuf in that branch.
In my refactoring, I split them.

Firstly, handle the second case. In this case, pxmitbuf is either
enqueued on pending_xmitbuf_queue, or released. In either way,
pxmitbuf is not owning that xmitbuf anymore.

Next, handle the first case. In this case, a new xmitbuf is
allocated for the current pframe.

Setting pxmitbuf to NULL in the second case in order to make sure
allocating a new xmitbuf for the pframe.


On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> And is the output the same before/after?

The logic is not changed so the output are same.


On Oct 1, 2026, at 5:34=E2=80=AFPM, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
> > + pxmitbuf =3D NULL;

> This jumped out at me, why add this new line?

Two reasons to add this line:
1. pxmitbuf is not owning that xmitbuf anymore as it is either enqueued
on pending_xmitbuf_queue, or released.
2. a new xmitbuf is expected to be allocated for the current pframe.

So, it is safe to set pxmitbuf to NULL here, and it ensures
a new xmitbuf is allocated for the pframe.=
