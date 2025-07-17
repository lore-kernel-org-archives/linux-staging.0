Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E7143C61;
	Thu, 17 Jul 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752716162; cv=none; b=iQOckXdl/EOs7c+W7AhKv+LSlHQQ6JAuWn6UHVgGOCW0mRuz/utlsPiVDUzzPJ2roTlRi/xAEUUqodMEboIssLabIrghLkkriUK1n29MQ3KSCaxvAKE7OV0wjnc8CIwf/nDC0hBNZ62QXIKc+g38+RSbYR/kA+pt7H+7dUHsyCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752716162; c=relaxed/simple;
	bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N71mzP0Y7toY83HWkZEW501nd5a/C7+WFmiFK//2qYRzinqoCiyfUofInf1ukp/KHLetA9hWUgY1RgR9IU3lpVBQ8Rikx6qRaKOtJ7U2J3cj/Zzstilre8G+AoAiEFeIVygoD8Jidgq4DI1FGYHIWGN4SDVM7S6AqwNWUz0f04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtwRigsC; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtwRigsC"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8b838203d3so74939276.3;
        Wed, 16 Jul 2025 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752716160; x=1753320960; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
        b=UtwRigsCePimgcIdfqzPGI+xrUbtxnChL/Z15psDoZz7nrM3KrPwK2gVDi5Ok4Kn+J
         lBZCS9hff1xmLqNJl//73kQreoiApnWl9VAVDXbgDdbWB68WaQ/sR8OBrqlhDHc0WAk2
         qv7Ay+BDVPdBkHiM8NXAbCwu0hzV35KQeVkWrXzO+W8wMAqbK7FMGQzSFIFxeLLRXhLn
         nts9Ftp3ykBp9+KNGSEGimfWntSBxDOu3c0ajHQJJcHttYoW4JxiqDxwCN+4Nzc3eS3b
         iOrzEv1qSaDroZFx0qJ2iKDGUgO7XuBugItP9pZIxkA7JAmnQ9xhZ1CtXIdgElTyhL20
         3EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752716160; x=1753320960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
        b=ZGHmtBDwyfyw5XfRToA/XHYigK7rcXFwQx03X+EXA6GmZLm+rxX804UmiIGSTu8GhA
         I9DBkLFy0Z09S9+OSaklA26QKrOe9MOy7xHArlcTEBAQGECWBsB590rjDMb7t2C/+lW3
         5MwKGOmRfTfWUquyUjTL2MBXzD4TyYQqNjyko7OwBOXu3V/cnK/5tH8km3QXoErxLHwA
         TopZ6n9gvVtzlW3hS5Jin3PJBrLujQNrVmQQ/KtufgU4qM832VJ4D55KpjywHHMB2bkz
         fnE6yKVDKwAcHw1fSNJyBkqtbwVDloAtJ7V4raRlbtGL7elb8gffMIBwiybPgYHU0DTh
         rP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1M06rizzfGaon3/eRG7kYpQ2ebo1Zmhv2DtueivwCNjhfKESx8z7vzFMPaFeXHHev/Bec7R+J9UmtPSaMaw==@lists.linux.dev, AJvYcCVRYBCdZ/ycRC1c1IE0A8glHK6JvSdRMnKp6TOEUshMzX8SX9EuZ7pihG3GdgFUbulksXlFxbW3BGueekNge8iZqmyQkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbAqADd5iyB6LWuvrnazJqmEED4gX1A0e2GCk4roxT+nuepZ11
	a4MnvExHUWlJv8TP5lYaWpBPViAVAKTr1TtIYZRQmkWVQ5J7/izbU53yjV1NOBe7TTPY5x5oTSj
	cUZp0eLjcoJTD3djE0fiQeTtleqMEbeA=
X-Gm-Gg: ASbGncu1DwjOFLCR+rpKYro4fEbuAqQpbKFAWFOD5V2ku4yg5ASCDBwdbh55cWHwA+U
	7cWt5ZAavy5WGI5za66V4JfWq7oZmETmCNxoXvU61nOBpFib1KxqkeQlc3X2FYw/fZ3vH/x4KTr
	xlSiSHeyJm3Lh/60n6+zb8NGUBSmomb17r6GqGzNCnpD5IWMtHHAcVDu0Pf5fs3Mkzqshaptz7k
	6wNCSwIMA==
X-Google-Smtp-Source: AGHT+IH/lQdFasnZ/62xy2rm8W8eVyEAu66p8hWMQS2ruZDTPQ4cnqhJNz+LLsT9MNxR7g7j30hd5GKkZuTm9PifFRU=
X-Received: by 2002:a05:6902:490d:b0:e8b:ca74:622e with SMTP id
 3f1490d57ef6-e8bca7464f5mr2429870276.1.1752716159856; Wed, 16 Jul 2025
 18:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com> <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
In-Reply-To: <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 17 Jul 2025 04:35:47 +0300
X-Gm-Features: Ac12FXxNSZIFdZuBHmzo8FplFaJtPqK8r6zWUmZ798tWJAaeeE-AzyDD9PmzLmE
Message-ID: <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
Thanks for your feedback

On Wed, Jul 16, 2025 at 9:21=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> > Continuing the cleanup work that is being done on the AtomIsp driver,
> > This series:
> >
> > - Process the error inside hmm_init().
> > - Unifies the HMM init tracking method.
> > - move hmm related function to hmm.c.
> >
> > Previously, These patches were sent individualy but they build on
> > each other so i resent them as one patch series
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
>
> These seem reasonable enough to me.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> But it would be better if someone could test them as well.
I tested this by building the driver and i really don't think further
testing is needed
since this series doesn't introduce any behavioral or functional change.
>
> regards,
> dan carpenter

Best Regards,
Abdelrahman Fekry
