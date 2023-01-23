Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754627C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:04:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bk16so10551258wrb.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 04:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAtEBkgqCy7U3IrEI3QZwX/vSHv0Teqx5ckWVZpW0X4=;
        b=lA8BsZaR0c/bqnrotg7waVOsF8i0g5/YNIyGhzUad3w0VweAu0r54Mt5GW6XxKb+LC
         ka8amQS7uR513K3CfNa4GBTv8mcxVVNBrEDgZ3seLokULseDPL0Ve/BLnfjQEwjSrMz2
         MD6sx6IY+2oh0DVuyicxl/mXZomxHGmLNvDOLtlvEAy8bvY4XGiFbX7R8hZPIYc+3PSR
         /928xk4cWoZeLqhe39tDYNffJipCDIHJw7/PEm4jb8oyhfbWLJBsstj/ctKwB2Vnjbs5
         kqHjdIUxvjL+EGzf3OMPQ3gA5p0Gtg4PubDsaa67qlvxvuwy5Gc7Yt3lcYvlCFLmNp2/
         nGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAtEBkgqCy7U3IrEI3QZwX/vSHv0Teqx5ckWVZpW0X4=;
        b=RZtlb+zwVhEhvKud+6SEQ1BZy9WCkgmb9jPB94qqubyouxBqrSYp/qfgtXvmLMdNNS
         n9wzFFtdfww2Wnad9pSUwrNkstVQTP9LoZ6IgwDtEWMZoIRWTTYz369e5MjPi78pU+At
         O/vxRFkFdNEok4yPWbkulKXyZdxAB6jDBn2V4pYsH4OLuOXZyIxN2xG2aHmKvjKckotk
         gGgSOBASUzwNiXc1KLtlWGSnhpI8lGcbf+WiMqr3fseTfIwTLG6vWk6CmYKQXHW7RMVy
         02XxAQ+xyRgOnGyWoS/RswAYCLdzBsct0BQInpE0bhIvUFPADEUKpr0z5QiH+6XhEctm
         2k5g==
X-Gm-Message-State: AFqh2koCdkz/Z4OYeVEsWQfRtc9vgAT9XsmU1fqyTQ1IJlmlyA9cjEAp
	o6rjwYueQFk5cVs8N8ko2i8=
X-Google-Smtp-Source: AMrXdXsDwMSnY/QaAwQHvsKx5pldjdAoB20ljjofuAsOL/wjkd4fq26Md81tgW+v5OXNZooIwtgpWw==
X-Received: by 2002:a5d:4e83:0:b0:2bd:d857:f96 with SMTP id e3-20020a5d4e83000000b002bdd8570f96mr27417098wru.60.1674475474821;
        Mon, 23 Jan 2023 04:04:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w8-20020adf8bc8000000b002bdc39849d1sm30540126wra.44.2023.01.23.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:04:34 -0800 (PST)
Date: Mon, 23 Jan 2023 15:04:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y853z/ENGez4zlMz@kadam>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
 <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com>
 <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
 <Y8lS5eBliYw5EHBb@kadam>
 <CAMEGJJ2b1KFQY1m1eTcvf8_kGBBTjzrBD2i_M2uR+6v4gEcbVQ@mail.gmail.com>
 <Y8lVvHMIYeSOLM5q@kadam>
 <Y8nl++1Mjd7xLqZe@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8nl++1Mjd7xLqZe@pendragon.ideasonboard.com>

On Fri, Jan 20, 2023 at 02:53:15AM +0200, Laurent Pinchart wrote:
> Log categories are used to group messages in categories and control
> their log level per category. As far as I know, dynamic debug doesn't
> provide any such feature.

One idea is you could put the category in the format string.  Then you
could just grep /proc/dynamic_debug/control for it and enable the printks
like that.

regards,
dan carpenter

