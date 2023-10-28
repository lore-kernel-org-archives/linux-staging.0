Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FDD295
	for <linux-staging@lists.linux.dev>; Sat, 28 Oct 2023 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAqAnb9D"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so2917087b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Oct 2023 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698524550; x=1699129350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fe5fXMkIr7EM+O0J9n+FRFXxzPWDHsSnu766yF1x2Vw=;
        b=YAqAnb9DMMeyXRTrB7lfFLeGGxW/30CSHifsMzDrMoa0/6lyK+z+q4hko4ryhwTHNE
         Vw9/XUO31k3T8/U6NkvC5FemXcajKxPokarG6FtEc4sgCnYarNf0ORQIkm9CIyEH6jrc
         6qWoooAa8kMbOQBb6VKtydQgSkO44x18SxIppBNgLyUZ7D21HJWmayJGhcp9I7Xuuotd
         aGMviLx4hyJjd11w7wLcwU0v4Cly6e33n1kzppc+AdgvmQEC8hZ6SkjP//aTKl1eiN/5
         U0OrJhKvpuFlZ0gnHWuOcFkWv/uaEEr9/QLLE11TjTbW4J4WTXznmFp/UgLOMSQho6T3
         1kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698524550; x=1699129350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe5fXMkIr7EM+O0J9n+FRFXxzPWDHsSnu766yF1x2Vw=;
        b=lgQVIT8yjwsiQJNHZWQ036hQuAnlomZ5LMqw8gdEP4kys15c7WHLpRZjr6sTthtVP0
         U6UMccFcV5dBXi5jBnLCGCL0V2PGO7YyFidMMIZXhHfumoiVn+31gruJjakZCPxs0Xri
         rCQto73fH/tDn7uuFlxQXBSXe5kAWfvgpk+2Yn1h9GxbEcgxDKcC0XtqGubTVFXcSCkj
         E1ncAvFadtcHuwbqLeZO/wCd01VhyV8INeixtJqqGQk+3Q4+IntJhJWExsrWEIp1r/bd
         2amLPuAvVZ48gyYrJuASOWH6unSulztwFp3CrkWAbca3Kf1frrtwfMfBl27FU0FO1jLv
         0pGA==
X-Gm-Message-State: AOJu0YxsTYG885/c2kbm3lEUAIKut+jqGMZOH3wgtC0WVYycIgvFEBuF
	5lv0Yn0yzzrZrsY3GMxXf3c=
X-Google-Smtp-Source: AGHT+IFdkZReASb/EOwlYOdiXGWEctOWhxdfuppy/VQoYmCS9GGra1jo2ndmWGzw3i5h2aj7sGXhsA==
X-Received: by 2002:a05:6a20:3d83:b0:13f:c40c:379 with SMTP id s3-20020a056a203d8300b0013fc40c0379mr7358092pzi.13.1698524550125;
        Sat, 28 Oct 2023 13:22:30 -0700 (PDT)
Received: from ubuntu ([122.171.167.85])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902684100b001c74df14e6esm3658613pln.51.2023.10.28.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 13:22:29 -0700 (PDT)
Date: Sat, 28 Oct 2023 13:22:20 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH v2 1/3] staging: greybus: camera: Alignment should match
 open parenthesis
Message-ID: <20231028202220.GA2432@ubuntu>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
 <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>

On Thu, Oct 26, 2023 at 01:18:04PM -0500, Alex Elder wrote:
> On 10/22/23 7:15 AM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> 
> Generally, the result of this patch in isolation looks OK.
> But when you compare it with your next patch, what you're
> doing here becomes inconsistent with the indentation used
> for the function arguments there.
> 
> There is value in consistency as advocated by checkpatch,
> but there's also value in consistency within a single
> source file.
> 
> I'd stay away from these white space changes.
> 
> 					-Alex
> 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index ae49e37a87e9..6516e7efaab9 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >   }
> >   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp)
> > +				      struct gb_camera_configure_streams_response *resp)
> >   {
> >   	unsigned int max_pkt_size = 0;
> >   	unsigned int i;
> > @@ -378,8 +378,8 @@ struct ap_csi_config_request {
> >   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
> >   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp,
> > -		struct gb_camera_csi_params *csi_params)
> > +					   struct gb_camera_configure_streams_response *resp,
> > +					   struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct ap_csi_config_request csi_cfg;
> >   	struct gb_connection *conn;
> > @@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
> >   }
> >   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> > -		unsigned int *flags, struct gb_camera_stream *streams,
> > -		struct gb_camera_csi_params *csi_params)
> > +					  unsigned int *flags, struct gb_camera_stream *streams,
> > +					  struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct gb_camera *gcam = priv;
> >   	struct gb_camera_stream_config *gb_streams;
>

Thanks Alex for the review.

yeah, I understood about the indentation issue when comparing 
to other patch but fixing the indentation there results in 
another checkpatch check(CHECK: line length of 113 exceeds 100
columns) so didn't added any change over there. 

Regards,
Nandha Kumar
