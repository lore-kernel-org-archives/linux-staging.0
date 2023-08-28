Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F38E46BA
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:23:32 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so431619166b.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693232611; x=1693837411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LR+WaKAv8bFCpNLn1HT9C6vyjEwM7tIBgDBW1Ng29Oc=;
        b=oRWijh8pUECA+jhR1lOWv4zM0KbH+oQt9jKyakF4lLp3j0B1qgj2b12WX9KYkq2ZiV
         ucWpBdeYdiUDB7YJb/Xx9NYPG5nuAd0wo+w5+K90OkBceOKXg9+abSSwjO1JEMFtzfXX
         DWfWnqdRO2ZVos2vjg9GxJMkUly5qOh/qKCkk7uqPr0tPJhoI0FQttQCsNs3iVx4MOeE
         whxSb6pL8ne7CS1sADbgrH5nFsWP4JCD6ou5KLl0A6NollLYqkigDjHq4KabX0ZaXOWD
         ULOwEeWq/CcLYcA52Awj50Tgmq8PtCbeHfks+mZrDCEhAgOaglgKufVCnGehwRWn7yIe
         bgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693232611; x=1693837411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR+WaKAv8bFCpNLn1HT9C6vyjEwM7tIBgDBW1Ng29Oc=;
        b=QGYXmdpeSA4mcCvf8sWjZ9pYjgzxjqc+l9bZyJQ+Dh0x6fYtRV8iiicx+AQHcmsLuo
         6x5qjw6VdIm/qSW7IfRrZAFvDNRLaUPvOI06DVJecO5SIujD5PEsKz5DG4amAz+t3Ih2
         ZPkzt6Q0vKF2dDKA6LRGKzsZis2G1hKwXl6TCGCFnToYlihpzpjldCgvlXJnpaV5h64u
         gW/9Zbt8O9ep7cw2GDpvigDPNhM2pVuzIEe/5eN8JugvLlck84V5oIb6r9BVXn840rB9
         X2X0k0ZKWJ7eg0w34+9vMfYTiDJPrIif1V9ga6lfnGINEmFzgJhADxScp0wQFQ5Tp5wP
         +uTA==
X-Gm-Message-State: AOJu0Yy+Z8EyN1sWkbM4jN1tgl7XGn65AQpyfKBhtW7JAEK05gJaOxKD
	NGGD9goNNnspf+JznBLU2Ahp1hwFFxg=
X-Google-Smtp-Source: AGHT+IFsdWF4nx4kMCBbcVt4bM6HLGc1akJNpCdNi1oJzcLJPhDWDutIOU5aAhV3RjleKfdHuDRz0A==
X-Received: by 2002:a17:906:209b:b0:9a1:c225:1cea with SMTP id 27-20020a170906209b00b009a1c2251ceamr13949482ejq.65.1693232610645;
        Mon, 28 Aug 2023 07:23:30 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906710600b0099cc1ffd8f5sm4686690ejj.53.2023.08.28.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 07:23:30 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:23:29 +0200
From: Nam Cao <namcaov@gmail.com>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <ZOyt4QEYivtMVaFE@nam-dell>
References: <cover.1693229582.git.ozlinux@hotmail.com>
 <PH7PR11MB7643C65E067BAB032F930488BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643C65E067BAB032F930488BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Mon, Aug 28, 2023 at 09:39:14AM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better adhere to the
> kernel coding standard

Try to be more specific with your description. For example, mention that the
patch remove typedef cvmx_spi_mode_t because "...". Same thing for your title,
it's way too generic.

Have a look at the accepted patches to see how commit messages should be written.

Best regards,
Nam
