Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F4433D9
	for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 14:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198639; cv=none; b=Vlq1FSRWvoKdrKSQRejMPg7MMqL+YC23PXYdtHkbUUxCFBVQvk7JgywP7mVx0CZaTJ3oHNAQLlv0Insev06s3zouIGN2JAZNTZFgyrCMIMIwDlqwXPjPhxAK77B8O/91b4eIbprry2db9fnyqwOpJPjfEhJ0sRJTMqujtJcp724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198639; c=relaxed/simple;
	bh=gY4slTsrzigmIW7W5TPf/5NTUCDpLiT/MxahrSWIQEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXn/h5AS16qITYmuGbci5pko8K9sn1TNuv1o/Eh8usWrfj3tdlr2xzeAYgWneBu1KACesrBpuSO31C0BxC95lcRK9Ing0G4xaxqAnLcvHNBiK/v7WSdt9cXEj01IzitKEc7g1ueOMEF15uxQ5CrT9k9md8nOxQkn7aDtVKD4XEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VW8uen7s; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VW8uen7s"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfc035649bso1335707a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732198635; x=1732803435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjYV0f9LV8DKVMMDSPPIZsuPEs8fFiR62vH6BjDoHdA=;
        b=VW8uen7sYAeNFGWc7mpSZZap3Yj5Noftx6PuTPTTQf9hawDq3za0gl0HBRZGUCYbdP
         sgdlShcEvB5A0zFHAa/CVeRbWXDmFMkCe3tELN08xc7ZM1RnY+tLH4o2ioYEP4meV1PB
         crUCi25L65I4lGseAUjIsVg73EUEeuQS0l1dUz5AJqnoKWnBjtjUZpXMo1VEIww/w5FY
         jTKaNCa5kThwuQ69lHF0XWCTrkbsj7gFHCzE2P1NUuDZSp2vCJbEQoJzqYlfFX0BE3Za
         EJx3NE4V++jhWKELUWf707f+V7BmMGirHqOXfa7wlVROWpTNP74l/r3up7r2vYRZvASg
         oHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198635; x=1732803435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjYV0f9LV8DKVMMDSPPIZsuPEs8fFiR62vH6BjDoHdA=;
        b=mR6rTG4cjq2TJTsPpekum1TrJijIBeFYCcU4gAkTUPKCUndaz1scKEaggXRAg52yyl
         kNYKa3KWfmJq07k3uR1690GYp1mMSrKSsYLOZkogvDaAv8thS+3Js0UF7WnIJ77SwZv3
         46h6XSXquIT8hYGJkIuK/cTq3BYUCKjPq/55wsf5U//lKyzn1gi1YIaqx8lLPNbHt3nP
         Dv8WacbloVzmNCQyakIK2aTuaizRfJA7htCQJ3FWWACNAVVdGz9F9pRN/Uv1L1280ElF
         tM1BQLi2Bn63Y03XyJX8ffAMV2si9ZozQh4vhZa+8tdN/evcOW+l/9uV60g3wWCnca2E
         uZvw==
X-Forwarded-Encrypted: i=1; AJvYcCWp+8YoKaXBCcbWE214sNq25IfLA4H+3JqnJd4J7+chh7x1Dd/967NAI8xCwqEe4DqC/vg1Uv+eXx204I2h@lists.linux.dev
X-Gm-Message-State: AOJu0YyLQoG528on0Zk6dJ6NfYZ0MMz9Hv3yd00aILMPhaGV3fr/9OkF
	2LRzOdU5mgnFDZw5ilcgpLmpe6tgnTKHqXIloR9lb9m+haev+PY1axXIb0v9GYxHALDgCpfSipS
	CWQZA7w==
X-Gm-Gg: ASbGncubXLOWwti74bjH1bTkxFjCsDLqQmhfuFwC6wnISmIyPh1BahV4/5LromFcKWJ
	FxBOXY1on2QcgqkCmR3uK7pebSw3Xc+ZIk0TbftNfusvxHhUWKlxxqZEyUITnRdyA35Qqf46oiQ
	cvKmxvbOZjR+V1XTgzxA9ZYNFGTWSFJ0nqESVKRJqJKQqRwdUTp+GuX5IFLM/t35DE23Pv4RlWC
	OXjeRXSue30R0IxYd2NjHx1NQuCoHCHj3PRe5AWq2fGhUTcirnK/IU=
X-Google-Smtp-Source: AGHT+IFyOr66P+E7C7fnM/4Z3SPEljF0WWGFDrqoTUQ0MA6Kwx1at3Yb3Tko4ioxPpp2Dhuf/ouQLQ==
X-Received: by 2002:a05:6402:4404:b0:5cf:d5ad:2809 with SMTP id 4fb4d7f45d1cf-5cff4cb51c3mr5195197a12.24.1732198634797;
        Thu, 21 Nov 2024 06:17:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44ef2d7sm1866994a12.19.2024.11.21.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:17:14 -0800 (PST)
Date: Thu, 21 Nov 2024 17:17:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: Kees Bakker <kees@ijzerbout.nl>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] staging:gpib: Fix a dereference before null check issue
Message-ID: <47c36187-7315-4a32-802c-4909599e36f7@stanley.mountain>
References: <20241120144653.377795-1-pperego@suse.de>
 <a0807e04-b2c9-4261-9b3f-7660fe258f56@stanley.mountain>
 <6ca90e87-965a-4895-ba72-8144540f6e4c@ijzerbout.nl>
 <b843f8a9-1562-458c-8f6a-c59b1037b756@stanley.mountain>
 <wgcv5wesq3q3xank6elouewntisernnw4agfziqekkeirftx6i@ajucs5yqsvus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgcv5wesq3q3xank6elouewntisernnw4agfziqekkeirftx6i@ajucs5yqsvus>

On Thu, Nov 21, 2024 at 03:10:02PM +0100, Paolo Perego wrote:
> On Thu, Nov 21, 2024 at 10:37:30AM GMT, Dan Carpenter wrote:
> > On Wed, Nov 20, 2024 at 08:54:16PM +0100, Kees Bakker wrote:
> > > Op 20-11-2024 om 18:04 schreef Dan Carpenter:
> > > > On Wed, Nov 20, 2024 at 03:46:53PM +0100, Paolo Perego wrote:
> > > > > This commit fixes a dereference before null check issue discovered by
> > > > > Coverity (CID 1601566).
> > > > > 
> > > > > The check ad line 1450 suggests that a_priv can be NULL, however it has
> > > > > been derefenced before, in the interface_to_usbdev() call.
> > > > > 
> > > > > Signed-off-by: Paolo Perego <pperego@suse.de>
> > > > > ---
> > > > You need a Fixes tag.  But I'm pretty sure the correct fix is to remove the NULL
> > > > check.
> > > In the whole agilent_82357a.c module there is no consistency whether
> > > board->private_data needs to be checked for a NULL or not.
> > > 
> > > If Dan is correct then it is better to drop the NULL check, not only here
> > > but in a few more places as well. There are at least 10 functions were
> > > there is no NULL check for private_data.
> > > 
> > > Run this command and you'll see what I mean
> > > git grep -3 -e '->private_data' -- drivers/staging/gpib/agilent_82357a
> > > 
> > 
> > I had looked at similar issue in a different driver:
> > https://lore.kernel.org/all/2d99b7a6-f427-4d54-bde7-fb3df5e19e53@stanley.mountain/
> > 
> > Here the NULL check we are discussing is the same thing.  The private data is
> > allocated in attach() and freed in detach().  The detach has no need to check
> > for NULL because we can't detach something which isn't attached.
> > 
> > The other NULL checks are in agilent_82357a_driver_disconnect(),
> > agilent_82357a_driver_suspend() and agilent_82357a_driver_resume().  And there
> > the NULL checks are required because it could happen when the driver isn't
> > attached.
> > 
> > I also did a quick glance through to see if any of the functions which didn't
> > check for NULL should get a NULL check but they all seemed okay because either
> > the board was attached or the caller had a NULL check.
> > 
> 
> Hi all and thanks for the fruitful discussion. 
> 
> > So I think we can just remove this one NULL check and everything else makes
> > sense.
> Please, apologise if I'm too newbie here to understand next step on my
> own. Am I asked to do something, to submit a V2 with the correct Tag or
> the patch is good as is?
> 
> ( No pressure to be accepted, it's just my willing to understand and go
> into the process :-) )
> 

Please send a v2 which deletes the NULL check.

regards,
dan carpenter

