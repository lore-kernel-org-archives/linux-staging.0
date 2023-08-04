Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCB9BA28;
	Fri,  4 Aug 2023 11:53:28 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bc3bec2c95so14384515ad.0;
        Fri, 04 Aug 2023 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691150007; x=1691754807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPfUugozke0xZHK2G6ZVoxwKlgvkNxeeW6Xc7Z5HpOc=;
        b=cSOYFvHD45uitEjlRgodH2MipjM/IO6p+gmv6IP/+Df1GE4dlHRpXRJv3MGmHk+A82
         8OwLBOePAytpgTch8l8+w4C8Cf6lqSi4wrbqd1acM31kSB46lEKyNbt+hfZmX5qNivF7
         YWbY2/iiskjFlh7V1/KEUMaSbT4cQZLkib0cLxPH5NVGEGiOUgaJbPivK4c0XQ47UazM
         L7XsjFwvkzy2Z76Ojr+Ei+1SSUIs82YV9K5Ob2b03OfC12q/0JVyCEDfvPqpCNDBBCzg
         17j1FjrkQIK7fe3xyulK6rwOW2Q9lpgb9CuqtlOykkwF9mu36/wQ4WU/KPe6rwUetHjM
         BAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691150007; x=1691754807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPfUugozke0xZHK2G6ZVoxwKlgvkNxeeW6Xc7Z5HpOc=;
        b=I3/6OqnafzBBSZTRLoXz6YB2j+ZApN++RMURgowYorRSUhK++LEHlEq7quTkPu7JrW
         uuyZODju4mIupsl4BdgJJWj4QSxjccoOgVccidEGK6sgyW07Z7bGbnWkSjU4QfiS9lbB
         0JXKyfioT6xEiZ4MsGUZUe/AqC3FrDqf0YrfkiDvUqzJsvxVgTBjPBuDpZMmV0M/xLBT
         ugcIZdhg3oRJIBmMi8wlJzKh9LImhelalD+HJEiRS3pCWWReNNFNmiiyBBd9Nze9HcWa
         UpqvDTNy13JHz9sVCmFFW2VIFxuCTOapQHXJdW9CRlC03fOBZnpntJ7vNAbb0AKUhD71
         8NkQ==
X-Gm-Message-State: AOJu0YzD9ePGB4syodXvDo55F+PcUpLIrqu6s3OBE2YQCTiaCR0AblG8
	OZYoZO4HxkcTP77+fXmDkdM=
X-Google-Smtp-Source: AGHT+IERCy35yfMK22wQ4okBelO2/4VJxRbjSaq3vZA2HJX0cl3XXl8RT8eUP/yCLrXJfMFRtUuMmw==
X-Received: by 2002:a17:902:dac1:b0:1bb:c9e3:6d4f with SMTP id q1-20020a170902dac100b001bbc9e36d4fmr2324193plx.10.1691150007591;
        Fri, 04 Aug 2023 04:53:27 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.173.209.14])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b8a85489a3sm1580807plb.262.2023.08.04.04.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 04:53:27 -0700 (PDT)
Date: Fri, 4 Aug 2023 17:23:16 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linuxkernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZMzmrADhbNCZFm5f@ubuntu.myguest.virtualbox.org>
References: <ZMpZixfZ4WQgpzF1@ubuntu.myguest.virtualbox.org>
 <f967a1d0-639c-4cab-8fa0-e04ccde4ed5f@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f967a1d0-639c-4cab-8fa0-e04ccde4ed5f@kadam.mountain>

From 15487baaf86627009a06ab5217428d3b29028c32 Mon Sep 17 00:00:00 2001
From: Pavan Bobba <opensource206@gmail.com>
Date: Wed, 2 Aug 2023 18:12:56 +0530
Subject: [PATCH v2] staging: vt6655: replace camel case by snake case

Replace array name of camel case by snake case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
v1 -> v2: added '_' in between by and vt3253 in array name
"byvt3253b0_rfmd" and replaced the word "small case" with "snake case" in the mail description

 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..8b913c64845c 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char byvt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					byvt3253b0_rfmd[ii][0],
+					byvt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1
On Wed, Aug 02, 2023 at 04:33:24PM +0300, Dan Carpenter wrote:
> On Wed, Aug 02, 2023 at 06:56:35PM +0530, Pavan Bobba wrote:
> > Replace array name of camel case by small case. Issue found
> > by checkpatch
> > 
> > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > ---
> >  drivers/staging/vt6655/baseband.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> > index 0e135af8316b..8b913c64845c 100644
> > --- a/drivers/staging/vt6655/baseband.c
> > +++ b/drivers/staging/vt6655/baseband.c
> > @@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
> >  };
> >  
> >  #define CB_VT3253B0_INIT_FOR_RFMD 256
> > -static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> > +static const unsigned char byvt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> 
> The one before it is called something liek by_vt3253b0_rfmd.
> 
> I don't know what by_ or bb_ meant to the driver authors so I can't say
> if that's a good name, but lets at least keep it consistent and put an
> underscore between by and vt, by_vt.
> 
> regards,
> dan carpenter
> 
