Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4C2D0C63;
	Thu, 17 Jul 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756849; cv=none; b=V1jUucSdSE/4XBdmYm/PJQOEbaTyG7NxHVOMZ1PipmHN7IyFUaKVe35O1evt9vqFK8vzKrddXUhQMnKeBTLhaN3Okd9RK3q4QqZCyqvn+9ec15AeIKNQ+8TCMiziGBHDCtObEEBsz8qLQVjO+1a06Wgod0bpIyNuu9ofzoxTscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756849; c=relaxed/simple;
	bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOy3Uu47nwIvHbE0yZvZ+IPZ7wdy3mUmfCwWima6+TKYo9Ae7rMubzimkKp+Q2SKfxtNIJC+/p7RtGRlQT4Nd0V9WQpPUbl1boKiBcvEg58tdtSIrIEuIaIEa7D2ynRO9R6U4WzQ+BUTb2vT+59hUqbfvUe7vD5KpCU+76rMpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyisYtDI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyisYtDI"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so203038766b.1;
        Thu, 17 Jul 2025 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752756846; x=1753361646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
        b=LyisYtDIfe48v1iB3r25zHuY8A64YJRjtQdffHrpKTZPw2Np6pBSfC8jrc37ywby6u
         WaNXqCaFdBg5sjV0j396/WJHQLU3gHiWuJpPdUeOv8qlmDhgXEc7O66uiGx77AQVI+Oj
         XgXZ8ciBPnLWdjrHe/nixxXa4wwWB3yxKN7dcTE7z5rUd+Su4DmGOJtqwsZjcJHsdzR8
         NMGEc4XwlRX3V6hcReYU4nsXr6kNJQmIUd4klJH2pJoZUwpyv0NCerbp2NwPdfYr/gFY
         DadAfg/hGyHRNPZMJwL2T7go3EknG6+f3MfxBQBNr0tKFWwAYdJvWnQF3kLpeT1FTysm
         KaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756846; x=1753361646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
        b=XchST4cWjrEBmTrrvpahb5vD6vhYvhSw3GfrI7RfXAm+0h7rwzngh9ZAOShUTFOmul
         VxiyMYqS1QPq7i7ZcPXlVh8ViACgxpVAWPWtWbMkqeiEGWSJg+RH0Ifvc2jCEIZ+sSUo
         agzCLae3/V5abYYMZeiLf711iGUwkqu15OFIwP/fA4pvuDEKXJn6wSKpfmbYL38CKtD+
         IGALzEaCw7khFdKShwZg6PEM07W3HO52Cu3a39SiOD7VFBLStNqfPiagdfQTHzaogSkl
         wzf/G5FwDIFK3JJhSCwNan6orbONR3+tkaQo/OeUf2G4YwMUd+lWM1+6m6Xsmq9FUyqt
         VZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCU2bWDuOxG3DZnNfkF8OmYZ4qeSuDKI/WWthmj/oANU89qUPhsh4kusIwrFn5RR8Ae1oYtlIz/SXTtbgd06e0Dts05xaQ==@lists.linux.dev, AJvYcCVwetD3jgFL7oQ9Ulxgb7qwtDm2sKHgRULv7igtbINYnLz+VnXkXsucvf9xzEvK6HuHhtG29rPcm7C4PJv5BA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUxU8h/Z/3OPdW1qURNJy9DKUP7ayKiTzdr8hsH8MMxjt5ZRMM
	S93vmsiwHWA1/yc4pbrTf2G18cLIc35cuMBvUUE1cFF8j31NGuIRX/sz72BLkIru8wvWo2B8xjl
	9J8yCQdsle3x8coely+QjsEQ3/a2+cVM=
X-Gm-Gg: ASbGncvKsRWZDobhZLE4PzhNZYiGy0tEWNV5MFsiEyPfiI+QAosCF2L4Wnp60QULJIX
	lFh/KMGJ7aS0pCeB4iam9I1bd0/HYjBh3Pxh72IqFPXf960xyTtkGqnOd5tdhBakS6W2w1SZ8nV
	MzVfm/RWKoKQx/eQ2YGKFYThwgvUPS0bXTlF91DFMXhUIR2dRjlzqcTFTkqXGhCfa8Bwh6lpSQn
	sJpcfE8cQ==
X-Google-Smtp-Source: AGHT+IGwgcvfuosm5N+DZ25mI8Ik05xk7HliuiBmFYrl28GiWWkRW4WUjkaBwNjkPRhTpYEMuODvsj0bfLReIdUzIcI=
X-Received: by 2002:a17:907:2d86:b0:ae9:cd0a:5827 with SMTP id
 a640c23a62f3a-aec4deaf092mr281081666b.20.1752756845076; Thu, 17 Jul 2025
 05:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 17 Jul 2025 15:53:27 +0300
X-Gm-Features: Ac12FXwwqnptpnT5aQ5qlp88PaC6-4KM13ZfLkpBCRIfiqwB3k8OHjQ8YI8f-Yo
Message-ID: <CAHp75Vei5e3TMxTTWXBZVWsGqFbYwn6QQoOKz-MYmFd4xaTraw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 3:43=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
>
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
>
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Now LGTM, FWIW,
Reviewed-by: Andy Shevchneko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
