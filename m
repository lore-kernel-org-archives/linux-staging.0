Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEE3B29E
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783445; cv=none; b=Gka0XPD0rZOHUpkUfzrruUqyeoh6ZCxZqjEp19tZYgaeq9Ss7ELWz11FO531y1yCb0H0I1zZjrKoqJk89n4DGcFz6wyzCJ56sUNlB+iYgWYJyTQC6FoH9hilrTHqQcbfTzTSEV3E5rCFwyW15CwgnVezvoa/iYehh10ACFLU7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783445; c=relaxed/simple;
	bh=S0tBL68alPBoiQhQgrLoetKbMqWhl6PN9VracU1Lsqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6u6h0lj1HyDVQU1duVQpqk31whnAmJ7XXiLOhkNwLFPLbSLA183lYC/Pk8LZB8e/szizV3GxAZWvrltue/AB4aEGAZxd5+AZDMe1QolzRU9pAWhrDh7kIy2wRQ0uh1HqKEjzb9/wXb1XretXCYkI1icctrWL1hlY872cz8Iy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gczZN2ho; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gczZN2ho"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-244580523a0so9060755ad.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783443; x=1756388243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6+lAEs4MsieSPVTZ/E6noXDmgaG1ojns092XrliUQI=;
        b=gczZN2hof7JInS+401QSZ2Xj2p3JzukaiFh6MYOzieydj4sXL3XvGfrv5sofcTDJKj
         BpjScRXCxNUoEpaUt+cJP8LtrJtvd7kHutxgFKHJjMpTg8t/ubrQsL/CboDrL6RvbLPH
         5JhM00HPgyRaHaxxvaQur4BLa87WR5pcu4CEogutUm33ouTL1j8v3xIdMENj2QQ72zNY
         ok6fpEGc60DG4gDCrQWFhdh98apd1buNDzh44ky8Xv9OLv6zrlxpPUS5pnp9xFbCyJGx
         SnkV1qNI7rMPqIrRTX2ODia/6eiPgPmdrQd0OQBi44ObnXmRFrDMFI0IwD0s30OmCImS
         6kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783443; x=1756388243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6+lAEs4MsieSPVTZ/E6noXDmgaG1ojns092XrliUQI=;
        b=Sv1JPZTPbwCVwwxE7EgQBgV7bCfsAgjT76hhnifpcll68B/Q6N0FK4qGM/g6ncsrtb
         KxpJC3PfayG0v98Y9ya3pTGM/tN2YgiDbBiJv1oV0uj9oCpsvB0/6UnsUIAuwVAqnz6J
         J9AygvD01/1Vs8/eT3LNiG6lWVuALd+1iOKy2o2tOZEmUxe7Z9XMPB+8K56jlIeqvrut
         9wCrMv/r8HJkoXc3uwjVxyVBcAcEYPxgJt/3r206rUKD9iqoN+fRvcVjNMl0TA4g7rYu
         GayJ8GAlZR7Zo9bteXpob1UbUxBLC0Lp+gjV5iXIxKgzKBBg7URoEUrvNHCn4RRwU2kb
         5fTA==
X-Forwarded-Encrypted: i=1; AJvYcCXrlyf6dlzOmsEzXGISOyJrPsN6X7T8g3fZugcqEGOHt5Izr6AfhE3x6RcsNihpsnvfHAIJkLYQaMAqe/sH@lists.linux.dev
X-Gm-Message-State: AOJu0YwlnWG0LvOzGez/IUTO59wamYwGjAstEXHw/Nl09y3sqj5EMgEg
	bndMI3gEpLHpohhKsdWcsDK0rh6rbWDfw/W5QWJO0Q4nHGxMvwlf3JcdkknZPWmaMrVj2EkIPya
	u0a9hTltgbdVCSwurQ3KYY4SHFHDXCYKnzGUUtmot
X-Gm-Gg: ASbGncvIvY9jZkLWeA5kwHcIJVv7CF81SwOxHSlaxB1I9QsrW6BA9j39/zonFDSVTYF
	opYwiYAp7v7T4Wbn9DHwpl+HaXEvso1ZRV4hafy57VktKkZgqnCOQ3JwgB/TV3sXia7/+q2IxDX
	kup9+fFVYYa0sGvLoJ7FIzqvYNzKXneak9bZfIJjt4S/13FJ02MVzNdcQ8oPUJQiOA8zYwUtkB3
	TCGTuY4Xx31LfQH//uMKWWi/fKh+NRf3ZEbK8RxOLpKwbVs+L9LJw==
X-Google-Smtp-Source: AGHT+IFKuVeM8P/4fFTgJ9U8pzM7gkzc2YyF0U06MGypBG9yR59a576LajRenIcFYbHnNEUd1SatYN2HBujM5YeBS1c=
X-Received: by 2002:a17:902:cecb:b0:246:2703:87ae with SMTP id
 d9443c01a7336-246270392ccmr1041385ad.30.1755783442839; Thu, 21 Aug 2025
 06:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com> <aKcRDWlRQ1gughvQ@stanley.mountain>
In-Reply-To: <aKcRDWlRQ1gughvQ@stanley.mountain>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 21 Aug 2025 15:37:11 +0200
X-Gm-Features: Ac12FXxRWvefi0pFzenHIpwJbcSrmWtx4bZJqgVYzbGZBgzhqDHq0XNWj_bwV7s
Message-ID: <CAATBrPH-TTAdpCyCopZNsgTCqwnTBxjEiBg9HQ8KnJaPESA6Sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary inline
 declaration in gdc.c
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Dan

Posted v3 applying your suggestions.

Best regards
Adrian Barna=C5=9B

On Thu, Aug 21, 2025 at 2:29=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Aug 21, 2025 at 07:01:28AM +0000, Adrian Barna=C5=9B wrote:
> > Get rid of gdc_reg_store() forward declaration because it brings no val=
ue
>
> The subject should say "forward" instead of "inline".  Also add a period
> to the end of your sentences.
>
> regards,
> dan carpenter
>
