Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D629331A6D
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548810; cv=none; b=pvOrlTOA/KqaZoi5YSVRsnaazS9NxS5ehjmbLGZJZRAN5/4R23MSDwng3RfI/1MBSTczaVaxdI7FCmSsM5xehRLy+sTl5dJ72nMQTRwUzdSK2byN39uy5iZWn6rfE/DG8tuTQ2hdNZgI2aLgvWS0Z143nBzTyl9cxHcFjRnOkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548810; c=relaxed/simple;
	bh=sdXpgFB2aDwpg9YRWe3hCgtBwJrHqIIhWRsVIFgM+5c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JVm4oYDtorygpf+wugPoM+k5Wr+IvXGt41omY1eVFsc2RxZBLvL+WsWk38kq5ZyhCnTXrdQbhScUju39D8RsUoGGH8dr8V5ItAtA+vHynwF4F5dBedeWrwJ0EaskZessk5YlGv+h320fPyATGojfPicWzLYLsmJl8ahZ31gL8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHFF8u71; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHFF8u71"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eecef1a3fso1723972d50.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548808; x=1775153608; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdXpgFB2aDwpg9YRWe3hCgtBwJrHqIIhWRsVIFgM+5c=;
        b=MHFF8u71UyJCkOcxzpyjKyCy//VASMQO9omYbY7xiGyp/OLbzm0aBiWZu50n26Jx7M
         Y4Byc2vKVn7Y4dx2oElXX9rB+psOgFEzhCnnvQt0PiJ0tYRh1CYsmMH1Ly368rWJTN66
         q9fU0xB99itJ6TUzWBhm5C2VEEAwN/oaRi5f+XTEAzEGQp10TWuJ/lJl91H8Qpgg/6Ce
         9dl9ip3oG/k+trbozNW2+DV3V2yLbsxktZxigFKqzz7qGIF+IodhzlPqp4pxkVOPNplf
         HXQlQBxnjjHFUK2Qb5H9+I58LbOULwqY+34u47AXCuibYWk2viWVQzuUW+kvfpbIWsWC
         Cdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548808; x=1775153608;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdXpgFB2aDwpg9YRWe3hCgtBwJrHqIIhWRsVIFgM+5c=;
        b=l1QdajPiH+Q49lK2mjJhObTXPPEuEilDsps5lDLv78uC2LKm9T705nk2dv+zOoxa4x
         fVy2tdLXqmZ0ojgHkfvevqtGBTmXb8SPdiW6dTXYkkoGjUquif5HMGES29IBE4bWl8ME
         SKT3I0EHj/sb8vCl9tqfK24lrmNJ0UzQaIyFCKakzQIahG6d1wxXOp5GgId3aSYVCMam
         cXkEgsLYGPNAC02zSpUqVCRxhkfoSOxV64kfc53FwQtc3Cxb4+usnrx5vCVB8hbUNvE0
         aQtzOD2Y35DwSuep0zNIq8AKYX3e3shJkvaKCNpmfOyd9g8PRpDtN/5bmANFJuYOvAeY
         F/kw==
X-Gm-Message-State: AOJu0YxKydhb+jYBAk2bLxWb+2C0WWA0YXVj95S8VJhnp/RQuIphz1Hf
	pnN0nK2pLFl/2FBR8WS3/OjtLBC8/I7Hm5WN9CJ+yOdNGCGAHdlpHol7
X-Gm-Gg: ATEYQzw1XW3/ayAOsvaR7uThHjP05jmUmhMHz4hv9JY1t2Qab6dYHkMGKae4tzjpJhK
	dVgm0tntrdTSpkiPQOrT3rmaxDxrVLvNnjAIddKFnHNU5mkNMnJLRSPJftJb7ch51/qxTigDkd/
	aEOVbbDvocFOmiTTEuz9zC1Eez7ZdioKFZEwcU19OU4YyAq2JZ0GXdPVqQ+ooVg8z5Cn6DGZdn0
	i0PdHL3QFMDSCF3NGoKOJuZmubunJRB8eNhKSfBL4pOQoYsDiCXr6+Rh2wwtmXmLae4LJ62Zvhk
	E8a6KjZ9nXr+rDdQPt80ufniq0wtPcDKKQA15UQakOAmNwfGfHaxZreC2NBbS89LfbjMxEPEbHo
	cRAEXcqBklaDRkrEgLTghumNaNQNZ8Poj11qPwfDclX8umbV5U0LNuJTBH76zZIBb1TY/RtzvRF
	1q3ve7FP05EyxeXTYTewlYatLSyjQvxfONBeNN4aI/FJoVOFusWuiOIA38pIx6GTfGgnmunOuMp
	CnIQ3yLaxyNTFMyKsQ+8iWssK6fjZwZ
X-Received: by 2002:a05:690e:1442:b0:64c:f872:bee9 with SMTP id 956f58d0204a3-64ee60b80femr7972247d50.11.1774548808468;
        Thu, 26 Mar 2026 11:13:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ef58ca09csm1787601d50.5.2026.03.26.11.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:13:25 -0500
Message-Id: <DHCX1V89Z0X8.FWX3O4KWXA9Q@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "MrXploisLite" <arokigaming@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove spaces before tabs in
 hal_com.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325235519.36499-1-arokigaming@gmail.com>
In-Reply-To: <20260325235519.36499-1-arokigaming@gmail.com>

On Wed Mar 25, 2026 at 6:55 PM CDT, MrXploisLite wrote:
> Fix checkpatch warning 'please, no space before tabs' in comment blocks.
> This change removes spaces that precede tab characters in three comment
> lines within the _TwoOutPipeMapping and _ThreeOutPipeMapping functions.
>
> No functional change, only whitespace cleanup to comply with kernel
> coding style.
>
> Signed-off-by: MrXploisLite <arokigaming@gmail.com>
> ---

I believe this has been NACKed in the past. This is just changing
whitespace in a comment, it doesn't really "improve" anything.

Thanks,

ET
