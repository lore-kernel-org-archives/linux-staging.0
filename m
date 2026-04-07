Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1713081BE
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573218; cv=pass; b=T4F8klu+J2r42GgjSvdSK676Ugr22AwTg+GKvq8y0mtehPd121U9Kh7WXrJYP+zkieWm87ZveuxO7CK4vyF96bEyz7+RSy1eS4RRoawxGHM9MAJc2L4HshS4qQP5aSSWUi2+APD3lR4ddjxbbx0ZaeYElox3dTYS7gDgdwjks7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573218; c=relaxed/simple;
	bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HzaRKgo8TGJjSRi3eWkNj/oNhrpCvTmE4AFIlpVwYcyPiNoW1/ZD3MwCsxpyPohd/1CeZT94PlpLiu5c9kZPz0skppQBipUrnsc9etxS/G/LnyNbWoqYBfzyGuGqx9/FD3r3oVCH/nOyNBSNJxKAFUkXrDK5oN3APZghT4nQm4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqc4/86x; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqc4/86x"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so4958726f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775573213; cv=none;
        d=google.com; s=arc-20240605;
        b=TazNdfaITuq9QoY5PCBray/xNbDJaH9Dq3l2Ql34Cer1LzDLnPYAZQBpGI5l4ApOgO
         Gq71flyqetqgH4zgpxYavH0R1yvRKmLJy7BL4civdUxljZUez8ZeWDB9l2DcQbauHwR6
         D/2xBW+1/AH06lDUM0as/KihHhP3XZLF6jcOe6CB848mCmy9XW/SnY8IIGm3SEfDxE3L
         6XIkTIAVrPBdmERa0HoiXidBRR7SnevSzW+Q99lJcwhu8fXyaWTsBWCwoMG2UEEaJOU+
         a+XXv9e6yDeIN7OkvLEusXjiKCOvCEfwR9/VEjKoerHRFqy+cKgWD5CSQ1DfJ0xCt7oa
         LTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        fh=siVs2IaYoEvXlSmiw2yZPVFkoKiT+W/TzIrAGaMQLck=;
        b=ca1fOXTKAsabmCuQ6JMXgC1c8lP/VqzAvPSmebWckdllhqzNUqbIFfjoOht4JHoAoJ
         jKMBoWuQdC0KNKWGaJon7sOOlUh7FycvoJZp6ubWaHuv7fJR3HbMG9jJJ57GY08waFm4
         ZfDDV9dHOfuNCnZfW7MNTpdGQLG1XLepypsWEzZcwoRzGmHOGGEL6Q7IGs0EEGr3LEEk
         dUK8mjq4oRyFAlIuJfj/i/KhkxB+rvSjvIFM/2FeJ1SS/gv97WKSS8MYc4VteYgtOgWX
         NXmKjHnRKWUSH2gPfcioLrf/4daF2OCNteLnxdLQg6I2TMn27P2G2vAMlzw4TfS3TIKA
         U//w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573213; x=1776178013; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        b=lqc4/86xAIqoUnpJ82ftt622z3+v7jK/3zheXQRwDN8x6Dr3lggeW4LfSJ1VDJLbiS
         Icktn/QtRTnp6C2eXR+/sw4CaXlRD820abO7yrDKgQykmb+O6aXPPv7RNypgETnMHgnf
         IkEIMiCraaxZEzbD0dvR5pxE1Uo8fJ87uSRinGGW6xOlq4K+6aST4ij0pUU5OU7r/Rdb
         wL7c34k9XoJ3YQo0gB2ZKNIiwD77ADK/zgL8wVuMeTYIkwYjmEkYFfCbIZ/nJURatC3D
         lZn8bj4/AwO1Su4DEaxTLp6IGD+mcYmmrYan7P9C9qjEGwYLFG3o0c/C36kyiv/yPWqx
         UmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573213; x=1776178013;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Cnx71gl60criqRh+/EmGRELRaf+tx0+/NasoC8ft6M=;
        b=gH0QUx/6zZaslEtplov5X54o/Gvo4oMbMz33B+FDIPMUE1TiqzqZ7GdfkRbRxuWa2B
         pmt5WspXOyp/trAYikaDkmH/0VGfc01+TtuNUioCsT80jnd4s1EC0hNTRoh9CZEA3RwW
         K1mMQ5q9TRYdh3BgmvkHcjHPELx26eXHZVJ9vr/6CfZtnHwummWFLmkg8J2zUkbIjvPe
         kZcdAV+Aq13fqONTnQvEkEAAxtTCo9XLF4AFz94638ZypTdDq7zi4Jl+FOlppoJqiemU
         v994A1TUDuNL3cMWGE2l5pYoEZ3Ni3eSklnbYDaedCrLG4y/K/n7lj5sz/Ec7nydfseh
         QbIA==
X-Gm-Message-State: AOJu0YyhZp0x5HGWZ98n+0eJ3TBIGN4Zv3hMcJhFTGzfClyWTyG9BYxx
	/eo1Wk2gTLMH8e+v+r335KXcJtsrsqmqgA6dJoTVijirsUZHIz3FXIExFEg3W/6ev66BTEeCH1e
	wBjEVlWijCIWPN0eYGRf54a2A2ehCCR8=
X-Gm-Gg: AeBDieuEyYP30q8CtJ82xSMsJEcxwtEgzjdI9kJXCD4xD0RgRQncx+bCPXL52STj12o
	rkEabIf0jQm+fBn+E5d3kVcQGVifDYnAwJqra8OLzLbIa6GFS8xG725DLRvEQpCj8OeETytHx4D
	2NymXSnp28LEzcxGeJ49o0xq8lOdPPfcHhXoh6qZd9isMfxeb8XYORTxuT5mpV3hz0PI1cjnDNU
	w29onJpqCHVaa59qTNxol5DXWfo+8rIaZuM4ucq3R2SLcw6AUVZ4CEo3YnKXVIrtvNjxECyKgiN
	+KQdI9FXKBRLA73lzlxnuKNtTiC99uxAtxrQ2gFihkvfRqTnkH0g71zK30WNmNNoKXI/ox4Lg6/
	4sK6xGDuuzTfMJy1DbW0dv7PLeRgTukjg2Hr9
X-Received: by 2002:a05:6000:1886:b0:43c:ffee:ee95 with SMTP id
 ffacd0b85a97d-43d2927bbfbmr26716584f8f.16.1775573213177; Tue, 07 Apr 2026
 07:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 7 Apr 2026 16:46:49 +0200
X-Gm-Features: AQROBzCcgtjlQ31v9YNz445uL8yl3kw-1JhuneAShdXjcufJcizxivNqJRSZBmk
Message-ID: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Subject: [RFC] staging: media: atomisp: change copy_from_compatible to iov_iter
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy

I've had some spare time and looked at the copy_from_compatible function
in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
and patch for adding iov_iter support. What I find strange is that the korg1212
driver already expects to receive the userspace data in the form of iov_iter,
meanwhile atomisp expects a from and to pointer along with a boolean
whether it's coming from the kernel or userspace. My question is whether
you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
file (maybe separating the functions to user/kernel, since I don't
really like the
passing of the from_user boolean) or if you were hinting to a ground-up
rebuild of the underlying atomisp architecture (which is definitely a tedious
task, looking at the source code).

Thanks for your time.

Kind regards

CJD
