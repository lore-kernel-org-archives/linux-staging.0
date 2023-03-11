Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627A7B;
	Sat, 11 Mar 2023 06:24:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h11so6951651wrm.5;
        Fri, 10 Mar 2023 22:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678515863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEAB5UcFKezf78Y1Bog4LTa3d4NoqJ+/Ij4qU9A9IPM=;
        b=qRlBKCXOGW8I0xIQseEgSFEYMVA2cZq4nrO1Y1iZTSKp3cUIe/mIYsvH4wNUEvBWmQ
         /e6Ni0ss8msM+FSMTy+7KUG7xVEHhQ6ANHjr/5uUsSonnjbb/6wa64f4XB9JJ8iZITK2
         OHGtcjGmTnDTGMPfxXrpgLI8y+uDogS9Kpk++e4biWraJnxnbeg6QIfyrEm9huKaDCwz
         iosk6VIuoSS6HOdACj6Sc4mdrQJriqsZySlEnpDr67EZS0klL/1DoIBRJekPh1w7V+ld
         kfPFHb/bii2T/uF1xmZ7WisM37dxYmJrSGQopqatKWutC4Kn4ac9bvJQU7C0GyNH6jS7
         FUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678515863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEAB5UcFKezf78Y1Bog4LTa3d4NoqJ+/Ij4qU9A9IPM=;
        b=tR2dMD/uVianbO+93jj3zI+eFce8Hr6bcrXCJsL/ieKFJs5REOjKXhj43wUvWAv6Y2
         RXcrUBtGeD6C/mSp9w9IC6p3zy8nK8HfMYdFtdoEMd1aL/uhqmDneJ42fZfSTIuAzKb8
         FdlfJorMXpAoOBmAQHndZKyh/RDJ+hC3y2wrxHUEjtuCfK5vkpe+AS6JrmPdVDqSEVEv
         svseiFrsohQC5CFdq2aJNt4fafvyikbU5TbXBVlGmZJyzN25Oz7l/kRjr0pc0UOhO14P
         pP6YBEvacb91vXn6hp+R37KJ3KraotMDiBz93fT4DbMD4+jDpuhY4Ie5D78hAg1iBx9M
         G0Xg==
X-Gm-Message-State: AO0yUKWWwk2+CicyiqvwCBKH8iPrfMbMKofkOAXDXCFbkPphvMqgfUo3
	ki+t7xhg/NB19yyJxbt7rlA=
X-Google-Smtp-Source: AK7set8Jzcnic34saMsxy6VPjJLGDWjdB3YrVpyVGMeXFbMQMcUhMKG2K1kpLHtNqeccy1biBp1AMA==
X-Received: by 2002:a5d:67d2:0:b0:2ce:3a46:cef with SMTP id n18-20020a5d67d2000000b002ce3a460cefmr16390394wrw.3.1678515862847;
        Fri, 10 Mar 2023 22:24:22 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d58c7000000b002c55521903bsm1549822wrf.51.2023.03.10.22.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 22:24:22 -0800 (PST)
Date: Sat, 11 Mar 2023 11:24:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <ZAwelPOv45zThK6j@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>

On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > In file drivers/staging/greybus/arche-platform.c,
> > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> >   line.
> > - If condition and spin_unlock_...() call is split into two lines, join
> > them to form a single line.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > Changes in v2:
> >  - Change the subject and log message
> >  - Merge if condition and spin_unlock...() from two lines to one 
> 
> Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> see the problem.

Hey Dan!
When I run checkpatch.pl on my file, I can see that my old CHECK no
longer exists instead a new CHECK is mentioned saying 'Alignment should
match open parenthesis'. I understand this from your previous email.
Should I stop working on this file and leave it as is?
Thank you!
>
> regards,
> dan carpenter
