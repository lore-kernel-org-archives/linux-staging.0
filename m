Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918B203709
	for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488560; cv=none; b=bBqLAzMJr9lBNSFzEk25K+WloHs0juSxHWA7Il8SaHMxMxMnD9gn+P5gtEmuKI1ShzgUJ3rqkB+QrSuDvWlooBQJRuKyaKi68LONgsmgOk9jTuH3XZRwkEuacabsiA42awwgdL/mBt1j1QAfUvzC2PQWXTw7uE8Z4LBwg0WLrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488560; c=relaxed/simple;
	bh=GfBv0+2Ig6Q/5M8ohpa5wt34MrwK4ksWEyDMsdwY+ag=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BYL1NTLskWTira3v6n6bxIxEKWhtNvzj9vbvEHU4igKoNagKDlPs/djF8BAETiIiWAgmzWYqj6f3fXz5xv3OUyYJUpYP5PPshsA5HIBhW464cpbA2nkUTKvM6AjApIvnNtfFc2cjvtJJL3LpD27z+z4/z/Qc2dlS9s3uY9GnigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyU1i21f; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyU1i21f"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so10054481a12.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 05:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740488557; x=1741093357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GfBv0+2Ig6Q/5M8ohpa5wt34MrwK4ksWEyDMsdwY+ag=;
        b=XyU1i21feCqe5qyHsjXm+zwm5eCnlP8ies+GX4dWFEill8FWhS0eRiRGXaZ2C1GFzB
         zNe6/cvk3sHESwfRcY+iur2aRO7xq5EDwVkycT2oz6Z4hZW/kNrRZh3ZA/b7aR1WYUj9
         qHBQ7/fwM4BrDoFARroHw7AQK+k1uK2tdZG9GQ/YfmsGKvkQ6RrMQw9FYK1bpRHCbnPw
         MRAKxAuKxv+auuwn6vwSoeJF0C/+kEp47P60GRcR+dHYiNjRMpbR2QUPdo8EP85zik/W
         5WxQ0QAkowdcxfUOXUv+v0J7xbg9+uGUjR5NR1B4qE7fIqtP7f+EpU08mRkiYgODHCAK
         XIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740488557; x=1741093357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBv0+2Ig6Q/5M8ohpa5wt34MrwK4ksWEyDMsdwY+ag=;
        b=Y9zMZBTp0bGCz5EXVWdVaac0m9Q/kDT0B9kdai6thGru9vPbrDEagjv7NR2HqmZRgb
         MGFTY8Evw1NPRI66lUIT/gKEappW81toLkiquwcdf7EK2Y2/ezRECvqvgRb3t6Dm/UGX
         ohrsFr5czGttuO7hAhqFBgTOIZ7kY90d6mljhI1bkizXpFoZ+7E6O/B0x6qahh1O4+Yj
         e2k3rZH4EGYDFI8P4uASUPfcyz2qIi0YyjAKv1dhprkl4PraKMVonZlEJYwfur8EdwOm
         HMaEhXRiFOYQdm3W8WxhBCGEyDVwpHOQ+L6iV7EWIXJy/PzHwxMsvI5MMYDCW+vQFyVO
         0pXw==
X-Gm-Message-State: AOJu0Yzex5Pugar1Bz4fCwbrNX+mvozarb6tmA+9OejSBV6gLtW+NMt8
	YYcZ+l0c7e0KvTSaqA6dyFjFnQ7RK0FUfT/mGJe1uLJVhrIzIdRgJ/vOQcZ1JE5QbLrDnlJO8Wi
	PtpYpr+KO6+jZpzj7ztxxku+GO6g=
X-Gm-Gg: ASbGncs0KvejWsALni+KJB2M9rVgl+9aiuK+bSQtQHrrqzaH129tIRrnaaGDFCNl503
	aGe3mrZKYQM7zhiKt4Hqqvx9e0QmtXoRZV066kXaAaDy9l+YqmMuLkkCOo+t56oods5Ms4vnyiD
	ilefsChA==
X-Google-Smtp-Source: AGHT+IGKsZfJvxcjb7PkMuNRzzrsgmgOoQbOBOqi+Lpi6M86G4RV2k2x4pLduAa2f8R0g20kTsF2wgHa4BPUgRCp4Kc=
X-Received: by 2002:a05:6402:358f:b0:5de:5cb3:e82a with SMTP id
 4fb4d7f45d1cf-5e0a1116e25mr23027748a12.0.1740488556516; Tue, 25 Feb 2025
 05:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 25 Feb 2025 21:02:00 +0800
X-Gm-Features: AWEUYZlvHmVokT8MMhqWrzdI6JeU7QSjxyre4OI-nzDa3gkCtbDXRBtbozQqtC4
Message-ID: <CAOPYjvaOBke7QVqAwbxOGyuVVb2hQGi3t-yiN7P=4sK-Mt-+Dg@mail.gmail.com>
Subject: [BUG] r8188eu: Potential deadlocks in rtw_wx_set_wap/essid functions
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	baijiaju1990@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello maintainers,

I would like to report a potential lock ordering issue in the r8188eu
driver. This may lead to deadlocks under certain conditions.

The functions rtw_wx_set_wap() and rtw_wx_set_essid() acquire locks in
an order that contradicts the established locking hierarchy observed
in other parts of the driver:

1. They first take &pmlmepriv->scanned_queue.lock
2. Then call rtw_set_802_11_infrastructure_mode() which takes &pmlmepriv->l=
ock

This is inverted compared to the common pattern seen in functions like
rtw_joinbss_event_prehandle(), rtw_createbss_cmd_callback(), and
others, which typically:

1. Take &pmlmepriv->lock first
2. Then take &pmlmepriv->scanned_queue.lock

This lock inversion creates a potential deadlock scenario when these
code paths execute concurrently.

Moreover, the call chain: rtw_wx_set_* ->
rtw_set_802_11_infrastructure_mode() -> rtw_free_assoc_resources()
could lead to recursive acquisition of &pmlmepriv->scanned_queue.lock,
potentially causing self-deadlock even without concurrency.

This issue exists in longterm kernels containing the r8188eu driver:

5.4.y (until 5.4.290)
5.10.y (until 5.10.234)
5.15.y (until 5.15.178)
6.1.y (until 6.1.129)

The r8188eu driver has been removed from upstream, but older
maintained versions (5.4.x=E2=80=936.1.x) still include this driver and are
affected.

This issue was identified through static analysis. While I've verified
the locking patterns through code review, I'm not sufficiently
familiar with the driver's internals to propose a safe fix.

Thank you for your attention to this matter.

Best regards,
Gui-Dong Han
