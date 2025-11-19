Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B92EBBB7
	for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557882; cv=none; b=rGGcrO2lG+7cAVKju2w51wukT0Ebr1Xh/LxUrB5AAfb9Kcaeu/oXtd89LIOwETzEdh8pqbcTPe24qLvDURQ0oYsAYYEzmOyZt/D3Yd4U1dM0ZtouOVAJ2hZHrscUagAD6HUJpqgrJzQv1TSYrvnLgMdDup+S0uwqZj+4+RUfO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557882; c=relaxed/simple;
	bh=sJLZgI9vl/ePXAMiM1HFoKkY761fjwT9P7fNtQPrjMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5hqt9yxKXrwE8qNZHS99MPimba+VzMML6GPP6I+nS/w6ATMeKWc+1ZjA2OmJXppelbOYHyqepr0RstfE0+S8Ay47HpgOHwnEnokZiIp9pdpmKCO/fqRzjUpqWg6B189cqqw6Mh7D9b0vAd1HD29Yw/VapK4tNHPmZVCpBs4eLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M91o6mZT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M91o6mZT"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so11746964a12.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763557878; x=1764162678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
        b=M91o6mZTRrzaEa28tvonUJ3jk07pXGL6v0fFIhzfu8mE702D0pb1VRxx4tfFJz6zyl
         Mqr8ueKN6EBu95h5v7eJpbOousAZJuMFoeQ+NfbuJNbWHe7txhNZP1dDOzn2p7/JEhsk
         6yh2lZ40Apy3WE4+6c27Q22TifirxkYV2ZOd1f9ClzvuSkUIfBN/IWlrkYNCleWWAPMt
         nKatkU50FOB0PQPcXldPe+BHGTMkrNj7zE+19BUlTiTaXJiGmME3Cu9o0yG/fz2EorS5
         TOT7nxwLda/nEbGS4CCfIvonsxeDUBIq18cU4wzRaYqaPwHZGaqAv6CBAeh07wnCbH/q
         E1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557878; x=1764162678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
        b=fserhe7iDhcJsVVl5pE2vPTxttgRyG1fXcb6CuwJFOvS70y3O4hLHK9u5FRnv8fpoe
         Za2eHsquvcqv7kRmyyAo8tMYAxUqryyRGx5YbrTDBaFZ7amMxi2AeWK5MW6v/1VLNsbr
         z9QfdYu0kZvDeJJnr7edQDu+8Ng5jZU+FwF769SOiTMCY3jw/N8zUReSiHX2rOcm7VdM
         nUGX+PKDGcGVK1dLaUxNYarIRAnTf0P8KrtVaqqV+1L1hehRVfSmHr4UvIs7piRQEH6d
         V6aWquQnHforKOxlogXn4wVvD238n7n/9HFRs7OIz0HssHayRO9q27ZqEG74uj7a1bcL
         qaKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZFFeLd0iCRBDMQzeApneyhmZEdH+FWR0VsvlW77zs3YmhCjqKOu2+npPAMyq6QIKQH5r7ezigMjIF2p3@lists.linux.dev
X-Gm-Message-State: AOJu0YzV0PmlqVtpe4oUXSwzBvluZLoIitpZHfM0NdP1t+6s5Djjr4PO
	Bo2QkDkW+Tx4awX37vLbp49WjjGl0qrVHuOUAYX/FkTsWF5hnLQ76+0KFENYCgMAsAI=
X-Gm-Gg: ASbGnct4fNiGOhnkCuWFoLM4y0QznAH2JMkiBnFcJHojce9xnaPbRmE2OteZsifPOIZ
	Ann796PLqP3E3ziA9qP8CFVQcZ//Ooki02lnWpUz3V6kiUyxMznsP+54nB9+/ZEiV+2rB6xeK2N
	HgpASps7PUd38qsLyH2VqpK9j5zvC7kedI0OK2FrsYhFrTVTYpSPnJyw2/pHy8gjvdeND5e8RZb
	P9KqxzxM6zLKjoz1mqgwDmeLu3PTJWz0YnE3eoOei6wQO56mcJP6VvRFWomPlb4HrcEekeuiJcy
	c/2RtVx6junPmY0DzpCM7zaoQwBg7NjYnjla9kON9jwGmsZ+/2qY6nS2hBIvb+/kte+d5V8TOz/
	FRDCCJn6MMovYlyrK6AN3CC1UrgqTXAoUWHsHsDlPtU5ilY/6zUpVJ/uc1wW4qsAz8QZbNmi1Ie
	PbP2hiI6XFYv4pcg==
X-Google-Smtp-Source: AGHT+IHh/9HSY9QxYY7JWRlsHkQE77dEey/TQadLHho4kIFH9l0Cnuj5X98H1aD+vZkw9c2t87Tcgg==
X-Received: by 2002:a17:907:96a7:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b7367c02586mr2099815666b.59.1763557878059;
        Wed, 19 Nov 2025 05:11:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm15093392a12.5.2025.11.19.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:11:17 -0800 (PST)
Date: Wed, 19 Nov 2025 14:11:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>

On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> Here is the third part of the unification time printing in the kernel.
> This time for struct timespec64. The first patch brings a support
> into printf() implementation (test cases and documentation update
> included) followed by the treewide conversion of the current users.
> 
> Petr, we got like more than a half being Acked, I think if you are okay
> with this, the patches that have been tagged can be applied.
> 
> Note, not everything was compile-tested. Kunit test has been passed, though.

JFYI, the patchset has been committed into printk/linux.git,
branch for-6.19-vsprintf-timespec64.

Note, that I have:

   + fixed the 19th patch as proposed, see
     https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/

   + reviewed all patches but I triple checked 7th patch which
     did not have any ack yet. And I added my Reviewed-by tag
     there. ;-)

   + I tried build with allyesconfig. It succeeded. I am not 100%
     sure that it built all modified sources but...

Best Regards,
Petr
