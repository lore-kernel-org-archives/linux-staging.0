Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD2217736
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836363; cv=none; b=KNWDR+yHeoNn3kWK8rkcxnn0H6Lj8D51hFRwmZdT2SgVGULbTVlPgejWQcxSEWTnGiK2U5Mc0ScqUmXOmC2X53lMdvLAb9qOwJeXcRUIJnhkCborn5BlXqK1BKTQKILiQPK/0tL7TA8zA0SzXpjfd9t+P7tT+azR6RGRSD9S6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836363; c=relaxed/simple;
	bh=Uri4+7GDEUPxQ/zMJozScs6gf7ZK85JBRYKKbs/kB7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwsFbe7QmrmssuSF1sOFj79KqZGAfagD09T5DE3tXRy45nIVOPfARW2nNvo+2er5Md/pVY6TqS/1sVUrO+6NVFyanB9Fw8dh8oX++MBnt+tcxCpq44rdtPDztOO92VfZMqk2iLWpywAIGj5unodvc0aRv4b8YBInlekB7I8xP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dDi6x5hV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dDi6x5hV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso16742a91.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836361; x=1745441161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZswUWYqEVBTmYMarhm0YEpxYFGoYJ3ON3AdhVWeS0Rg=;
        b=dDi6x5hVxeYmrL3gb5p2CXPdq1bzQvMiE5g1UUFEqjzPkv3xKGjncBZjVQRbFrrqzD
         /XMR9GRLJTriPBZSlL5p8AYAOZCOtTnxM6opZPcrMtdV3T4IDFB4/Rw/cN6SKo58gL/n
         ubVgVP4//SRZ58J06MqIFbMGnQ9p0NIumLabWpFOQ8RSdc6VQp6Sh+dnrz9oQIMuw2/h
         L9aWXhGIUJST8in/Xhk17mw/LcfjXhERptzbGQaeIzVwc9WabGnhuws3fpLcfIs31sCd
         uCZIxj1/yPsdDBe3QIHHHukX16vpkc8o6XpRg1HlUxwdHhMc4YnBOLdTMsC7LVv1GsCT
         tFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836361; x=1745441161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZswUWYqEVBTmYMarhm0YEpxYFGoYJ3ON3AdhVWeS0Rg=;
        b=qTvibBb/lVz/yEVCaoCBfaJY20UG/KrKxNkL131sgig3f/D4/vNuR6wN4z5aK3nsRx
         UPRxQDsO81l0wYTkFRXaK0tnEG2MZwmCDSFtX7bUWXl4QcnDyGgmYugR56id4/s/APbD
         WpukHQOWmoak7UMdgPSRXLQyoeZMIIQckXqLu7MCQgaeoVh0eo4pbbo3wCXgo8osT5S1
         dxXYxJKAcMBCEgZtx+1txA2aB/XT7ItsAxcMV2DrCUWQj9llLrXggiDPP7qXkROM4tA5
         eY2g2GN+zg6AcWgIjQjzzROLUoONlO0ALgGq5A1l7POnpWLfNnZDuA4OmdJDkguSS4Nl
         KiVw==
X-Forwarded-Encrypted: i=1; AJvYcCVzzvl3Xkqm2XZMmwlLJjUvCL9vLYOvqzw4lAIo5gsCcppETM0jY540ElDwzX/ZIaFifyhDCLltDc3WzxsZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+W55elEyk/kBlgNCx92Ps24xOrvfDVdGMVaEouCZChSXcnXH6
	4rVYwbGOsbrMX04HDAQEydvXVv0HmYLAQt4SAHOnA4XoEd1IAINXHfQdrrjHSYlUSbnK9x3LNio
	=
X-Gm-Gg: ASbGncu+wwS2aSUSXwBgwatF53s0yu0heaujhBD4zqJd7SrTae4QMVFHphg8QIDq1fV
	2gRByi1NNimHVI6yZTgJ+HnCybTjL+YKcfMAuAbWVj42CFKsoFlEH3M2mpK4TcSnkM+Ke10oJrb
	ALmx3FGdPlGemC/ODNe9U2mW54bqKqYud8oLBXsNSwZkPJyGay1JwnWVrx2U/cNv74p6J91G4WT
	PQhSVAEhuZZldJ+YwUOWZ7wuzVMeXj4ZfUnGKj9wZcPuhCgwPQlCbJztOgKgxRRHfc5juxUmjkp
	FiqyJKW9fIT0KELUt8WnEN/K6oK2JBkl++mweoVUpY+PE3+ruJyJBtZ+VOhIt6jzTf5cBj1sGlC
	4VJyqJQ==
X-Google-Smtp-Source: AGHT+IEoQ75P7zQq8T5JMPgGw1/cthcGWEStg5iGqMCnn2UbY6rivsWXiXhNhO25Mo4/qNBOSkcfyQ==
X-Received: by 2002:a17:90b:5247:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30864172d65mr5494078a91.33.1744836361175;
        Wed, 16 Apr 2025 13:46:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d6166sm2115338a91.7.2025.04.16.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:46:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 20:45:59 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <aAAXB60zJWB1qRHJ@tiamat>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
 <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
 <Z_az87Yx-NJvGASJ@tiamat>
 <2025041512-coveting-scrimmage-9312@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041512-coveting-scrimmage-9312@gregkh>

On Tue, Apr 15, 2025 at 04:41:47PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 05:52:51PM +0000, Michael Rubin wrote:
> > On Wed, Apr 09, 2025 at 11:26:41AM +0300, Dan Carpenter wrote:
> > > On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> > > > Using Linux code style for gpib_interface struct in .h to allow drivers to
> > > > migrate.
> > > > 
> > > > Adhering to Linux code style.
> > > > 
> > > > In general, a pointer, or a struct that has elements that can reasonably be
> > > > directly accessed should never be a typedef.
> > > > 
> > > > Reported by CheckPatch
> > > > 
> > > > WARNING: do not add new typedefs
> > > > 
> > > 
> > > This commit message is quite long but it's totally unrelated to what the
> > > patch does.
> > > 
> > > This commit message should just say "Having the word "_struct" in the
> > > name of the struct doesn't add any information so rename struct
> > > gpib_interface_struct to struct gpib_interface."
> > 
> > Thank you for the input. New commit marked v2 sent to the list.
> 
> I think we need a whole new v2 series, I can't just pick up 1 of the 18
> patches as a v2 as our tools will get very confused.  Can you just
> rebase and resend a v3 for the whole thing?

I sent a new series. Hope that it looks ok.

Michael
