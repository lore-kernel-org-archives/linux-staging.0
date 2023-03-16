Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43320EE;
	Thu, 16 Mar 2023 08:14:34 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso781574pjb.3;
        Thu, 16 Mar 2023 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678954474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh4NaocRUTHfBtuFcWJ6twO4Zfej2qsZbIvJj6d8YrQ=;
        b=i2dPiNUakVTV07nSePo6/QTB2zmetVxWwtR37oxPvsmkQ33oGrVtwj6hoawCbMkzgn
         ywIVt+Xkf1Hyh8/bPiQKGtLxC6kcTFEMPo3kvQ9Lsck3rjXH1Hn663vnIpL4FpWgMS67
         KJ1eucw+KCt6o4szzqFAHAr9CinokgukMUP9Qto9RkfsZrL3KN/sSjBe4yxOx39HE0F8
         Rx4l1Twgn92r4cLblq3pyhqLWLUi5DCP1ZQ/H2B1IIxh1YDOq+31+JzG0P+XNebW4D1T
         KqEPQH64Ji67J8QCyXVjbONWmpFaI6D1Dl6U0KuBhhk6jqW+vQFCeF8YGyu8sCfSu3p0
         N2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh4NaocRUTHfBtuFcWJ6twO4Zfej2qsZbIvJj6d8YrQ=;
        b=Q6d7aALN2aYRFQ+9zKL9+8VpC+Qq76n2W0piaIwZAVaf8/Cx94EaAnoIMSy8TTriab
         Sqmxc00LC9Imzpz0itktbhyrx+O0h7H2MePUDklZCK8Uw2mFbWjK7lhgWoJd8VcYZfNM
         tWNywjglhiSID9Aujx9Njam6TtC89vp2+Hhk0P5vsVz+rCIuYc9Dggc6vLicL228qpLY
         5ckwiL3Nsl6LYtmMNAa5+2qWRbwyuH1js7IqnTtL6p5Rz+psowVNsVlmGpwBbPTq8Xxr
         oTqQe4TGBFqGaCFgZwyOea4IDOkNOYHYbhB6OFH4eH5E6MnEJJe7y4jjDgOlAqYh1fN1
         5DQg==
X-Gm-Message-State: AO0yUKWxHOoMLc7xZ53giXGSILc5MqApAVYbT/7iNG4z9M77lqQUZ3kX
	0p/cLdaMbHe5bWjTzcZuwJw=
X-Google-Smtp-Source: AK7set9pK2paw7m6Dctu5vfldLJKD/kpmus/xGzcGEfYNWs6eliMciSGNGbihG6unFbcG9p42FaGQA==
X-Received: by 2002:a05:6a21:3385:b0:cb:af96:ace7 with SMTP id yy5-20020a056a21338500b000cbaf96ace7mr3280065pzb.46.1678954474219;
        Thu, 16 Mar 2023 01:14:34 -0700 (PDT)
Received: from sumitra.com ([59.89.173.232])
        by smtp.gmail.com with ESMTPSA id s11-20020aa78d4b000000b005ccbe5346ebsm4773152pfe.163.2023.03.16.01.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:14:33 -0700 (PDT)
Date: Thu, 16 Mar 2023 01:14:28 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: qlge: Fix indentation in conditional
 statement
Message-ID: <20230316081428.GA47053@sumitra.com>
References: <20230314121152.GA38979@sumitra.com>
 <6e12c373-2bfd-48d8-b77d-17f710c094f7@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e12c373-2bfd-48d8-b77d-17f710c094f7@kili.mountain>

On Wed, Mar 15, 2023 at 10:47:21AM +0300, Dan Carpenter wrote:
> On Tue, Mar 14, 2023 at 05:11:52AM -0700, Sumitra Sharma wrote:
> > Add tabs/spaces in conditional statements in to fix the
> > indentation.
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > 
> > ---
> > v2: Fix indentation in conditional statement, noted by Dan Carpenter
> >  <error27@gmail.com>
> > v3: Apply changes to fresh git tree
> > 
> 
> Thanks!
> 
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>

Hi dan,

Will this be considered as my first accepted patch? :)

Regards,

Sumitra
> regards,
> dan carpenter
> 
