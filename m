Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FC20E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 07:50:24 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v1so15336287wrt.11
        for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 23:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55Yoxcq3+d/tHhqKEtTkuDqeutda58+RH9+uCLxHdaU=;
        b=KDr4QKS5v9Wzz/FasCrhsx3fWubdC8WFqhJci6NolcG7farx4GD8o4IryNQQxTGjW5
         cviPRTyGbAHLEOKoPjjqHakjocoeVVXr6kYl4Ffu5CLLX8Oii8P5BDbpTo8oIzZYjc5D
         UU6JmZVG+iPQ9jpuSyG61+qHIf6Ufh3abObfDscUdeez4lHEQhEs7ZDyupvz6i4mhK33
         UhcOPQhGBo73eqX643k5j61qyPGa3eG+hP79VwcEjDHtYYkJ2Sy8jArdWDjZr+YOXN+w
         ziSmZchc2jkSW/gSgme+O9eY0GJFuuJmaAZfSz06j9U5eNU9HyNmE5Hsy3pul/ytcZmx
         vO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55Yoxcq3+d/tHhqKEtTkuDqeutda58+RH9+uCLxHdaU=;
        b=g/zaAWGiSCBgCJBYzreIEQDgjntJ4MgOhTNa48mTQPSZ9uSPmD86zdFivhBsYFIRGs
         1yFMjpaSCjMCsUxh8Fj9xKnIAfUIjZxmVLEgW5UaD08+lup00f82fGUos03xYTKiwVn6
         kbOu+s9Yii5NKcaQwKO5mxpyiRv2kbOlGq5sc+yHkoqjf7Nk4LJzMgzEbkyDrSMnRFpW
         IHVEjAhxxZgQvRUHFskgS9OXyTr8Rhs9sqiJEcW6klffX9S3B+27IED1VTlAGMwzzDp7
         P7/oOVNdKbHptQ1HhO6fX/jBG12+YknDeL+o9CbAihTjRYw0V7pTznfm1QROIz608lIc
         zHUg==
X-Gm-Message-State: ANoB5pncSSk0H3b3eOpsxyhvELADZ/JNUlYnxQbWUAGdV8t+KaLpYERr
	RxZOuvyRsi4TlUY/PNfgtm0=
X-Google-Smtp-Source: AA0mqf4DtT9wZsjWyUAYN6zeatBId7DhcpzfU4wz52q06/sbxMcArt87PiE8gaEY66Xcay8E4ZcKkg==
X-Received: by 2002:adf:ab1d:0:b0:242:e73:f642 with SMTP id q29-20020adfab1d000000b002420e73f642mr4712465wrc.184.1669621823018;
        Sun, 27 Nov 2022 23:50:23 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4002000000b00241727795c4sm11804792wrp.63.2022.11.27.23.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 23:50:22 -0800 (PST)
Date: Mon, 28 Nov 2022 10:50:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4RoOxgo76Hc5RRP@kadam>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
 <Y4RnJyiCDYavLAJq@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4RnJyiCDYavLAJq@qemulion>

On Mon, Nov 28, 2022 at 01:15:43PM +0530, Deepak R Varma wrote:
> On Sat, Nov 19, 2022 at 08:08:15PM +0530, Deepak R Varma wrote:
> > On Thu, Nov 17, 2022 at 07:03:21PM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Nov 17, 2022 at 06:50:55PM +0530, Deepak R Varma wrote:
> > > > On Thu, Nov 17, 2022 at 01:54:49PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> > > > > >
> > > > > >  struct hfa384x_pdr_refdac_measurements {
> > > > > > -	u16 value[0];
> > > > > > +	DECLARE_FLEX_ARRAY(u16, value);
> > > > > >  } __packed;
> > > > >
> > > > > Why?  This structure is never used anywhere, right?  So why is this
> > > > > needed to be changed and not just removed entirely?  Same for the other
> > > > > structures in this patch.
> > > >
> > > > Hello Greg,
> > > > I am unable to confirm that these structures are truly not needed in the absence
> > > > if a real device based testing. I could only validate that using the compile
> > > > build and driver loading.
> > >
> > > Think this through, if no one is actually using this structure, and it
> > > is of 0 size, then do you think it is being used?
> >
> > Hello Greg,
> > I did not find any memory allocation for these zero length array structures.
> > Also, the union or its enclosing structure do not appear to access the members.
> > Hence I am leaning towards concluding that these zero length array structures do
> > not appear to be necessary.
> >
> > There are a few other structures that are part of the same union, however, they
> > too do not appear to be used for accessing the memory assigned to the union [or
> > its enclosing structure]. I think most of the members of these unions can be
> > replaced by one max size structure of this union [e.g. struct
> > hfa384x_pdr_mkk_measurements].
> >
> > Could you please comment if I am reading the code right?
> >
> > For your quick reference, the zero length structure declaration are online 963
> > whereas the union is on line number 1080 of the file drivers/staging/wlan-ng/hfa384x.h
> 
> Hello Greg,
> can you please suggest how should I approach this clean-up/correction?
> 

Like this:

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 0611e37df6ac..6a3df58c9e9c 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -959,10 +959,6 @@ struct hfa384x_pdr_nicid {
 	u16 minor;
 } __packed;
 
-struct hfa384x_pdr_refdac_measurements {
-	u16 value[0];
-} __packed;
-
 struct hfa384x_pdr_vgdac_measurements {
 	u16 value[0];
 } __packed;
@@ -1077,7 +1073,6 @@ struct hfa384x_pdrec {
 		struct hfa384x_pdr_mfisuprange mfisuprange;
 		struct hfa384x_pdr_cfisuprange cfisuprange;
 		struct hfa384x_pdr_nicid nicid;
-		struct hfa384x_pdr_refdac_measurements refdac_measurements;
 		struct hfa384x_pdr_vgdac_measurements vgdac_measurements;
 		struct hfa384x_pdr_level_comp_measurements level_compc_measurements;
 		struct hfa384x_pdr_mac_address mac_address;
