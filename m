Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C5133F0
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 18:44:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o29-20020a05600c511d00b00397697f172dso1576490wms.0
        for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 11:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ch7twLtw+5fNTAlbGEf7CksnVVIfOdFAcyFmxvHg4E=;
        b=AdZz1uQLCuoO0bLwU16jQM8/iOGi+/Wk+LpUbPQcScUtsNZ8RawmarHeY8x1eNaFcl
         pvJMdKTl5V9vBfVx9/2iCQA+WSB4KBhtJe3bCBN2J2h1GIiDS7IOAbcSwnUrCWnafOom
         GLqVX2TyUtyFMw0bnodUGggR5b4lcOn8kH/UTT1I0OV/Vuhf1x469wMdPw41cRDEbyXS
         qFbPdwsLHyfR+3uMvyOqqsbvyas0SxAs4KmpEUUWWZVHItlWLlVndKPcpvnqRbEz+Gj1
         gwCWlBrkkDQRnj+R3asvRpmmr6A7tlf08NsrA6K//VoCiiNY+SMwF3m/ZO9EebyK5NTX
         1Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ch7twLtw+5fNTAlbGEf7CksnVVIfOdFAcyFmxvHg4E=;
        b=HD5HAehe3jOQatQM7mgtslArBG1rUJjuvn0E6W3x7Pp9086WJiIDOCOQQamrGwaCNj
         SRPrl0peOXXcZtz3yX0+PRNDXf0ttdztCi3p9s8/Pjv7IxDOSTdikDW1ZHqSuihF7i0K
         0ySj3m3wPQOczB2PwfvZQ1yPy9fiM6HtV/txaZG2IcHY6D6bHQInCd/oKGy32b6KcQln
         /ighN5O6afPIrqG6Cz0G5LiHVK20Ma1SxFDJzj6kJaetGIy651mkJcLpqWYc4nei9E1W
         SguxIdYNX7iQdj4JYJHeVBAz1yKqL67cy7I4ypH2XLBgmKczxKS7F5DR3trf+lDDsU5R
         zEkg==
X-Gm-Message-State: AOAM531L12okRXyGH/3D0PZKPo6aTPBgBxo5A0xbaJk0Lg4s/vjnO+no
	tozPCuPsNdGVY1bp7yyAIq00Mw==
X-Google-Smtp-Source: ABdhPJylgXfGE/jENacaw6AV75unEpt8XBtrZATb2cTQ3noOVW6zfJv8r+BuUG9LdZNv6D6Dqm/1Wg==
X-Received: by 2002:a7b:c445:0:b0:397:28d3:d9cf with SMTP id l5-20020a7bc445000000b0039728d3d9cfmr24845740wmi.116.1654022663960;
        Tue, 31 May 2022 11:44:23 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c10-20020adffb4a000000b0021003082534sm14432340wrs.36.2022.05.31.11.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 11:44:23 -0700 (PDT)
Date: Tue, 31 May 2022 19:44:21 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 0/2] Fix some compile warnings in v5.18+
Message-ID: <YpZiBfFZrPkcCil/@equinox>
References: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
 <YpW4WKxKIIgY0l7m@equinox>
 <bf78b567-5c69-c968-3dc4-6c94eeb8d77a@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf78b567-5c69-c968-3dc4-6c94eeb8d77a@lwfinger.net>

On Tue, May 31, 2022 at 12:16:58PM -0500, Larry Finger wrote:
> On 5/31/22 01:40, Phillip Potter wrote:
> > 
> > Hi Larry,
> > 
> > Both patches look good to me, however I've already submitted a patch 10
> > days ago that does exactly what your rtw_xmit.c patch does, in
> > addition to fixing the changed error handling semantics for the relevant
> > function (in f94b47c6bde6) which broke the driver.
> 
> Phil,
> 
> Sorry I missed your patch. I have been really busy the past month on another
> problem, and I was not paying much attention to r8188eu.
> 
> When I built a mainline kernel in the middle of the merge from 5.18 to 5.19,
> those two warnings stood out.
> 
> Your patch should be ahead of mine in Greg's queue, thus mine should fail,
> and I will get the "does not apply" message. At that time, I will send the
> other patch. As both of us missed the 5.19 merge, the build warnings will
> persist until 5.20, but no harm.
> 
> Larry
> 

Please don't be sorry - just wanted you to know in advance :-).

Figured if I said nothing I would probably aggravate the situation. I
don't have much time to spend on r8188eu myself either so don't worry.

All the best,
Phil
