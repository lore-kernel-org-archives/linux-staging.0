Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC8219E0
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719365; cv=none; b=JoKLEDR8mWgUuFyC83byzy+iJfQ7Fyyh0L1uwFHjRSUvyS6Rm6m9K6EN8PgYGzniuKbdE+S3z1F5+bU4El00Qchb6xo/Knj6aGN9Dtl4LBRYzMW7RRSuAfFpdHp/QRKQ/he/uiO9lSPVdy8N6K/0kXJz3TKSpQVyBp+RDOfAmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719365; c=relaxed/simple;
	bh=gO+eL83KdifAzJPi0HCo9DgdX1PW4Hs4m00dnR5SKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4HJowwm74e8Jpc9fuXUYTZCcx2YZOQciC4JICmE0nW99clo8R3jByrQX5eHiBuIbj8Vp2ig1w808QY4+8X3DaAkWSIvjemQLJ3aEpFlsGsNxziAowe+6q2X5kr+kqpTyJEgiRX088wXgQNPe6ENZXz8BAzjt1RJjbS3AdYEJBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNIQLvOH; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNIQLvOH"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c173211feso1314319a34.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750719362; x=1751324162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=iNIQLvOHkw3e+AaSPyyKRyBkVdwzUf0bB97y4B7knu735mDw566R6eAXMiqaw5NyMp
         V7HK2uFh4UbrwmASmmDpDOgCfMfyWCCP1rB9f5o+wrVyAGVv3g+qtNU/znFOwjOqyGmZ
         SeHcZ0iutT64xGz79fotPvlNbDc8TnhW5RdOQUVyYOcmr0rr4xYsm75e2ElHfihI2t1/
         IPrjUBDRAwDsgvByiKjblannwUISO4FIS9UdEyNIqbWCD3uvFMWAqsRHgfAbPobVIJFs
         rL/7+WWoSAscD084tOTdtKWVeZvxQwU9SbA75maioAFBT6WvONbXXd6ki9Vc07SkoyLl
         DA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719362; x=1751324162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=VHqIdNNSnozQ6klG4j5U4Znp5jTDFFlgw8ui6o1QFcfQxmSMizVqQiSbhl/vWynR4H
         2L6YiCt3L0umiifecvV39xSTOLpFtIr7sq5cVWqMtcy490ZPPmSpNLEgOLdatApYoWJ2
         2uDQ7rNWcA2faPFwQq8fz45j5C70IZVwpPciZCRzOSPuO715IopjQagnXkz182JE04Mr
         T3EMriGxO9MVLQS32EvSw1Zy/TZ4WshVehAwTTJ09jkG4eimUJYV3uND+Mvrj0twfKdU
         zbf1nczMsCJM03EAZXWaHWWxzCgQxrP5GCy1O1/RgwgXvJjrcYAtK111DICfhwUiuxMK
         uf/A==
X-Forwarded-Encrypted: i=1; AJvYcCXeD8gt2Qk+4HMEU0/D6NNDEK2oWdLF+2XN+kS2C8FtaRyeuM7ETzNfcEj3/u4Zpaq+kEziPRj8LnKsSYGv@lists.linux.dev
X-Gm-Message-State: AOJu0YzS0BRhCj6zrxvwkt7ytujH9PsCsBi0FNoLWVKjXm6hXqnl74En
	L6O42O87HCnvmRkDIPSaVhPwsuHjhEtkWl4dCC8//BGjQgyvs4oOJPAcMWlLnoCZfIo=
X-Gm-Gg: ASbGnctcMUXzod62B6GwAiAbNRaWT65IabOQDoO+aPvSbxF5O4fiwwg0IraAa3yFsBH
	DB4m36bIAWsTu+yw9Yc0F90FUaktmHBh4zDJagQW5FJoijCEnHVeNhFwhacxM0CLmkJzggnSQb8
	Gv9kxIjpMcV2i3BhkQa0YKEn98RncXbzIWP4iq8feKtqWFxsKWBL9C319sJzNFrYojum9xu/aBC
	3/I1OLDpsTK+LXzOUJ8xFHPo89CfxCN5WDSTIElQ6Rk4AUreYMjN7WJ27PmseQkOi94OTBTX6a1
	hwSjpfB20dffgL8UhCi0gwz6/q8RbzaTEDCpMAG/R5dqspwc104R20RwS7SYqifv3XIfgw==
X-Google-Smtp-Source: AGHT+IH2qJp3cfXp8vqsQfiwtJzTBVtR00oSUzJTlWLB1sUQjr8uuhV9Ojft3NeNTOmhlhWt7+2srA==
X-Received: by 2002:a05:6830:8104:b0:727:3664:ca3a with SMTP id 46e09a7af769-73a91870a2cmr8528739a34.0.1750719361986;
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm1612798a34.0.2025.06.23.15.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <30c88178-173e-4432-ab2f-beb26ab9d0b7@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
 <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>

On Tue, Jun 24, 2025 at 01:25:14AM +0300, Dan Carpenter wrote:
> On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> > The introduction of a padding field in the gpib_board_info_ioctl is
> > showing up as initialized data on the stack frame being copyied back
> > to userspace in function board_info_ioctl. The simplest fix is to
> > initialize the entire struct to zero to ensure all unassigned padding
> > fields are zero'd before being copied back to userspace.
> > 
> > Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> 
> The fix is good, but the bug has been there since the driver was
> introduced, it's only just now that the static checkers have started
> catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
> investigate.
> 
> Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
> 
> regards,
> dan carpenter

Fixed.

We should still print a warning about empty bits after a bitfield.
I bet fixing that will find a dozen bugs at least...

regards,
dan carpenter

--- >8 ---
[PATCH] rosenberg: warn about uninitialized bitfields

You could have a bitfield where not all the bits are set.  Warn about
that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 check_rosenberg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/check_rosenberg.c b/check_rosenberg.c
index 22df8a3e5b64..80e15f2cf5ec 100644
--- a/check_rosenberg.c
+++ b/check_rosenberg.c
@@ -221,8 +221,12 @@ static int member_uninitialized(char *name, struct symbol *outer, struct symbol
 	struct symbol *base;
 	struct sm_state *sm;
 
+	if (!member->ident)
+		return FALSE;
 	base = get_base_type(member);
-	if (!base || base->type != SYM_BASETYPE || !member->ident)
+	if (!base)
+		return FALSE;
+	if (base->type != SYM_BASETYPE && base->type != SYM_BITFIELD)
 		return FALSE;
 
 	if (pointer)
-- 
2.47.2

