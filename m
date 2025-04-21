Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433826560F;
	Mon, 21 Apr 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243385; cv=none; b=pxxR9d9GxNlMsqzxa6wBHaXXFG8vqM7moyrXl5oZ3tnzAK9TFu4KdB1wX4w+aL3b+GeJLnPvViNlapmTdHkWs2pJAalNwSDIMCHIl0jjE51coHNu9U2ArQk5MscVk7HHQ3H0FJHbBnoEJNuzbXtL1GU/d0J8l8omYwwbPuckyMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243385; c=relaxed/simple;
	bh=l977plpmk0kxbBwv0656HR/4LTk1DAyZQR5KKCWAEqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmU7rFGQEe0Uw/fbURxmgJroia+Yej9ezSHzT9+adglUw6gTst86ovDDgSN+uH0z5scqIy2No1sdF7ii93/m8VHeMcqf5t5CibV4mG0Fbw+CSUyszF8MUV94Uu1UUskiheysl3tMEhBDzFuv+VFcJrnXNd4fRCMoKkNWSo2sgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgpAysJl; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgpAysJl"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47690a4ec97so42789671cf.2;
        Mon, 21 Apr 2025 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745243382; x=1745848182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGx2p1+NRS+hgnX+A6l8EzX7jNG+2zBOfPRO5rKiie4=;
        b=SgpAysJls87BKit17tPTqSOJNUzHrT10Qn1kOGIuvPQWLKxQcf+zww63cBKXcb1dcL
         zodiwqtrarevIk36w6bo62vQPO7jUk2bXpqwkHUzE8mMeyzlY4Qi5BGwlKRgMkaGlMA8
         QdU5xHOXK4SXXLS1rvXu2l7jpcUa8fljAZSdWlW4SHCU+/qwU2sQFuHAHlTj47K9b1fv
         zJzxi4KsFipNsy6uJxkiC4qgwBKqMEZw/ay6nwLXYx6nFQoEagnQotq2C8+70xPLyn3v
         dpD30tWgvlu7gorHbgBDkeHFFPwweaatlV08jjWT09tSx8YaLkqnBwhQuMXdyTSAiwEv
         vrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243382; x=1745848182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGx2p1+NRS+hgnX+A6l8EzX7jNG+2zBOfPRO5rKiie4=;
        b=ItUlQ743g20QlMMzGiSuegv372Gm6vunEjqeBy5lW444Cm8mHNUPGdUq/1fLqzq+Li
         FIeQwbwb5mjvsm4ivVbiljQqEqZwEzOn0pTKOdIRSdPqkaVchoFeieX7k4JsnHsA69IK
         O5OckcQcdN3tqe8m5/VDEoTmrSw01oWkubLGCX30cRrKN49BLH3veXx7pqLBCquqwitr
         P+uF+uTr628JSYU2mNU8C/EamV83y+T6Q5r+2HPCG+H5heG+12FTERsfiyI1dPj+EROT
         3eGwWKarS8zagW5eis8bqhnzUsvIU4/+KJcUKoAH5nsVsMVjeNnMtzlTUCrQUvf8gaam
         Bn9A==
X-Forwarded-Encrypted: i=1; AJvYcCUvQqSkpZa9zXr9GQkK0pIMmKG/ntb7kmi49snXgOoMp8eNQ8/nhgAZxXlf8Qo/9gahIQMC0gVLMEGvIsuY6Q==@lists.linux.dev, AJvYcCWWWh4ys2R0/L9mJAjRXMyrlX7hyzcxiNq8i2F2mcGIzs2UEJu7/HU+wzMtgUEJBx81+1mOs75y+3rMuWGI3r59YhyVVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3VAy3/CuPVvojbwBrC5f8H8mi7GO7z7DtoLH+/z5LUWiY5xyG
	udguVMRudtImNfD5J/L4oauxsfjDytRuuPLGCi1TKN+7R86fOOflmLiBdvQwKuMIIpTedIb+OtD
	bATcsAjfqnnaHfbBY7VnIzTluounJXhS+RIU=
X-Gm-Gg: ASbGncs5WU9PY/r5l2kTQ2hORXvqLTkYGIA16PTz+DoMbfUiPC1p+x0Lx7+uUgBpNL2
	Mhb0kSrkTdDbzkPk1ApI0DgVTi+NVmSHaiHOjMLRzTTYbfxjw+MLyvoFxSU28fC5TUr5o6wU5gb
	/fxey1eZRUCAuEBmmRmjq1cfU4EFJb1YwXikregKHdUa+Gigjq54zq0g==
X-Google-Smtp-Source: AGHT+IFCRDEQECEJYjxyKWUBfHcU70YDu9Hdfq/MMsvE0/1Ruba11CTbntRDCvns5SkXCogDR5hE0ZbhsSjPtbHP/F8=
X-Received: by 2002:a05:622a:255:b0:471:cdae:ac44 with SMTP id
 d75a77b69052e-47aec4cf303mr202416191cf.47.1745243382551; Mon, 21 Apr 2025
 06:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420014910.849934-1-gshahrouzi@gmail.com> <20250421123127.3a5a7d65@jic23-huawei>
In-Reply-To: <20250421123127.3a5a7d65@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:49:31 -0400
X-Gm-Features: ATxdqUHi6_oLdhhSvnK3V3HpaBLwSd6oHgBL4E1raTEh9xxnYSdB_6-I_5_l3Ro
Message-ID: <CAKUZ0zKZ8QfbkPAWaJ59LVR4KfPa0mjv=vx3_NnH-yvx1kHavQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] staging: iio: adc: ad7816: Fix channel handling
 and refactor
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, sonic.zhang@analog.com, vapier@gentoo.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:31=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 19 Apr 2025 21:49:05 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The original patch combined a functional fix (allowing channel 7) with
> > several refactoring steps (introducing chip_info, renaming structs,
> > improving validation). As requested, these have now been separated.
> >
> > The series proceeds as follows:
> > 1. Fix: Allow diagnostic channel 7 for all device variants.
> > 2. Refactor: Rename the main state structure for clarity before introdu=
cing
> >    the new chip_info struct.
> > 3. Refactor: Introduce struct ad7816_chip_info to hold static per-varia=
nt
> >    data, update ID tables to store pointers, and switch to using
> >    device_get_match_data() for firmware-independent identification.
> >    This removes the old enum/id mechanism.
> > 4. Refactor: Add has_busy_pin to chip_info and use this flag to
> >    determine BUSY pin handling, replacing pointer comparisons.
> > 5. Refactor: Simplify channel validation logic using
> >    chip_info->max_channels, removing strcmp() checks.
> >
> > Regarding the 'fixes' tag: I've applied it only to the first commit
> > containing the core fix, primarily to make backporting easier. Is this
> > the standard practice, or should the tag typically be applied to
> > subsequent commits that build upon or are related to the fix as well?
> >
> > Changes in v5:
> >       - Use correct patch version.
> Generally I wouldn't resend for this. Instead a single email in
> reply to the messed up version saying it is infact v4 would have
> done the job.
Got it.
>
> Alternatively a quick reply to that thread to say it was messed
> up and please look for v5 would have worked to make a reader
> move on directly to the newer version
Got it.
>
>
> Jonathan
>
> > Changes in v4:
> >       - Include missing bracket for condtional statement.
> > Chainges in v3:
> >       - Split the patch into smaller patches. Make the fix first
> >         followed by clean up.
> >       - Include missing channel for channel selection.
> >       - Address specific feedback regarding enums vs. chip_info data.
> >       - Use device_get_match_data() for device identification.
> >       - Move BUSY pin capability check into chip_info data.
> >       - Simplify channel validation using chip_info data.
> > Changes in v2:
> >         - Refactor by adding chip_info struct which simplifies
> >           conditional logic.
> >
> > Gabriel Shahrouzi (5):
> >   staging: iio: adc: ad7816: Allow channel 7 for all devices
> >   staging: iio: adc: ad7816: Rename state structure
> >   staging: iio: adc: ad7816: Introduce chip_info and use pointer
> >     matching
> >   staging: iio: adc: ad7816: Use chip_info for device capabilities
> >   staging: iio: adc: ad7816: Simplify channel validation using chip_inf=
o
> >
> >  drivers/staging/iio/adc/ad7816.c | 94 ++++++++++++++++++--------------
> >  1 file changed, 54 insertions(+), 40 deletions(-)
> >
>
