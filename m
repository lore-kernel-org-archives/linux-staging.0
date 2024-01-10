Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D2364CF
	for <linux-staging@lists.linux.dev>; Wed, 10 Jan 2024 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpDah3Ei"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d542701796so17816695ad.1
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 23:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704871700; x=1705476500; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4hCFMRY+A+NO1qDRBfwFR3Up1EWuonnTR8ubqV932Y=;
        b=LpDah3EiJJDBON/HvJMBUhDAkAgpqM/mWSmIJIkpX3g83/LgFF9X8v9IsN93a59d0x
         NN33iHux7rQXb0eHmYaKRxd8vV3Gojpy1YaUaF2pdfi26dMJUEbY4yOMnHqJt5RGkQs/
         Yh1DfuZGPHiuqLAYZ8iB4NIASEGk9yxX7Pa3IvBzFtSi2tAR4PwJjMixzCsFnc7BIkBY
         AYCzAwoEWf6AvtNyjGQBunuL8PZ7eyFfFh3SYHV/Mwpleeke29Jtq2Y8ZHJYq03Zq3kW
         IkgA7HbG3GrrIUAhm3H1XlA5g+yNyZgAllqTE+sYg37yp0AyhzMjvDlL/N4QTu0irdOK
         36ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871700; x=1705476500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4hCFMRY+A+NO1qDRBfwFR3Up1EWuonnTR8ubqV932Y=;
        b=XvK9F1hg/Jr8G6F4Ldwsk5VMEvxNgiPgezlypzs9mTR4tStht9L74XjyrNljEgGNUA
         uUV8ZvoQSm8rmADbxUVfiUIfi3gpT2W5RPQKI+q23QRUmP7Kufhnd0jnDS7mUPc4s7x1
         aB5oXe8OEfG0TXTxcKLK76PIrqTbEUGaCSzEHkH7xSJ7E2Va1ORn1brdxxmwjjftajwx
         uMKTmBAvOt031LrIGOOlsmbHF3B+st7pdDQqver76mecXMUIffRrN0JK2B67UWg8m/Ti
         4JL6hWn7sg7Jt/lC5QsXoWZ+NV6kGuN/32fLBfnd1FvlVWIFp9x3e8QJNsU+InkEkJMp
         YcFw==
X-Gm-Message-State: AOJu0Yy/tkHxFfevXOe+cVjskXcA4Bmyr8ld+fbuBcztYeRhcx88ieot
	AcgOx5B45Yfc1SgIs7qZebTWBUflVoA=
X-Google-Smtp-Source: AGHT+IFzzbpaiYlnb1p+D+kIsrNquq3WKGZsYPPZZ3iMUy/KRJdb8QHeSnRfrMsXlrn4SUaG/AA7vQ==
X-Received: by 2002:a17:903:1252:b0:1d4:5a7d:21e4 with SMTP id u18-20020a170903125200b001d45a7d21e4mr496708plh.6.1704871700060;
        Tue, 09 Jan 2024 23:28:20 -0800 (PST)
Received: from mgyee-VirtualBox ([47.152.33.114])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709028a8400b001d4c9c9be42sm2929136plo.151.2024.01.09.23.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 23:28:19 -0800 (PST)
Date: Tue, 9 Jan 2024 23:28:17 -0800
From: Matthias Yee <mgyee9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: fix open parentheses alignment
Message-ID: <ZZ5HEVvaGwaiGLWz@mgyee-VirtualBox>
References: <20240109205933.3221-1-mgyee9@gmail.com>
 <0efd34ef-1543-448d-a690-64e156607441@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efd34ef-1543-448d-a690-64e156607441@moroto.mountain>

On Wed, Jan 10, 2024 at 09:53:53AM +0300, Dan Carpenter wrote:
> On Tue, Jan 09, 2024 at 12:59:34PM -0800, Matthias Yee wrote:
> > Adjusted whitespace to fix checkpatch warning Alignment Should Match Open Parenthesis.
> > 
> > Signed-off-by: Matthias Yee <mgyee9@gmail.com>
> > ---
> > Changes in v2:
> > - line wrapped commit message
> 
> Nope.  It's still 86 characters.
> 

Oops, just fixed it. Sorry about that, still new to this.

thanks,
matthias
