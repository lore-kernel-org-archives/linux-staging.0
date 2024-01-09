Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38439FFD
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgYOmW5W"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d426ad4433so16895135ad.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 10:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704826614; x=1705431414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jPr+SDh04cibZ+Jz/fbZ1baj85lZM6byocbkZfLXFo=;
        b=hgYOmW5W/UveBMkrMCSTy2z/A9lVyTFvdVsKK1mwGXYArLBc8lMvc9T03VAMqw4JdI
         5qVxavAtv0PvsFtDr3qJqGM5UTS2mqbq3+O9AoV5UJFnuJCszV2sCp+LlIC3fSas94t5
         IbdNpfV2/uHmQ1ydTmTQcc8UREZZrULecrmwTrArMJ8b+HYGAnV5tVD8LpA3Yre1b4MR
         VROVf7WUL7G4zqtJYs6MVNQbkQLH2Ht/KJggNgsI5E8oH2i5L/pnm7vwvpoOemla3vXu
         ixmYwqS301OW/W0pX2ujWVzTiJJmcuuogLqysq0WCmuq6U8DetoFQLJAtTf/V2xzLSka
         Ng0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704826614; x=1705431414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jPr+SDh04cibZ+Jz/fbZ1baj85lZM6byocbkZfLXFo=;
        b=N4/3M3KjeebcWhY+X1OusCwC7CqfNEkUtYQ+pVdhVAOpQACwjxa8ahoHL+fEdOhOGN
         PvYuq7hhyEooGAfmhO0Mhg/HAyRdOoDrSBVQWJbid5KmTd+/lxG8iINw6DyEWDDUvPQn
         H1qY9MpfnG3PgLoa3v61+TyANgFT6W+Eg7XCpqkRdthW5BvTI6HyaDFEl1NzVHl1h3wa
         ETgHVYvJ/+6eS6KoZa98ujsAQz//fDOiuaUrd5o6kxe0MBUE6/rbHdzOk+h8IPTLCItw
         R1pSQYlNa44WJpLrMhhmK1XR/tw84Vu/D6XoYHLCebWH5f92kgJhI/uc7+W9KAxxvMAi
         cUhw==
X-Gm-Message-State: AOJu0YxBVdN1zD6YWOF/SpfBGBqo9O7pjU59BgYW3NovADRqGpSTMbXq
	ONcjcnWPsr4nCOX6Ec3erMk=
X-Google-Smtp-Source: AGHT+IE1w0FHYtfTGUzm/jTiCE5Ev+DGOi60RZ7MAmkeZ2qAKAHzsDJ3Acbhaa6gEC0nWNIsQtF+Ng==
X-Received: by 2002:a17:903:2654:b0:1d4:abc8:8934 with SMTP id je20-20020a170903265400b001d4abc88934mr3025255plb.42.1704826614295;
        Tue, 09 Jan 2024 10:56:54 -0800 (PST)
Received: from mgyee-VirtualBox ([47.152.33.114])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902b40800b001d54c41cf84sm2124992plr.63.2024.01.09.10.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:56:53 -0800 (PST)
Date: Tue, 9 Jan 2024 10:56:51 -0800
From: Matthias Yee <mgyee9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: fixed check alignment of open
 parenthesis in card.c
Message-ID: <ZZ2W85ap2aMBDi8F@mgyee-VirtualBox>
References: <20240109063618.2810-1-mgyee9@gmail.com>
 <cea37e85-cc21-498a-a09e-cfdaf7921844@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea37e85-cc21-498a-a09e-cfdaf7921844@moroto.mountain>

On Tue, Jan 09, 2024 at 11:22:42AM +0300, Dan Carpenter wrote:
> On Mon, Jan 08, 2024 at 10:36:19PM -0800, Matthias Yee wrote:
> > This patch adjusts whitespace to fix the checkpatch warning Alignment Should Match Open Parenthesis.
> > 
> 
> Line wrap your commit message at 75 characters, and also run checkpatch.pl
> on your patches.  Otherwise it's okay by me.
> 

Sounds good, will do. However, checkpatch.pl gives an avoid CamelCase
warning. Is it okay to ignore if I am only focusing on the parenthesis
alignment warning in this patch?

thanks,
matthias
