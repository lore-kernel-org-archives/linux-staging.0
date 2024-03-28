Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47E37B;
	Thu, 28 Mar 2024 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711612664; cv=none; b=paCDA00NpdDraqoQovcPOr+q0jxSCDC7NbaYCyVEDt4M5Uf3zc1/hP5uxKm2hdTBB1Zy8kRhsNRIZtUeukGw7QuIwaAlsYRNIPTgSwWgnWAKzxPBzI7J7V4mTiWGTC1VdC+CudalpU1OLfeHM7iHv37HdpFI0RFeb3EdT8HXTt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711612664; c=relaxed/simple;
	bh=Ykk5j54CrXF8Gc0MNwakndBqctWdj6NqiHrpMavfno8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8TFiXj4xZFY+ifbK1peA65gKlkPHRooPw0IkFqQ+uH+s4aZdOythRpAgN/rxHGkBxJgoCzA58nQmtDf9wRT+HKlCk4UclVab6YTB+3wi2lJWBeS5Vp1mepASgRUUlxorAXEAVbv7oGnMdNg1DOqRalfz3/L/h2apDIErHpQzow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjmPXOQw; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjmPXOQw"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc73148611so692236276.3;
        Thu, 28 Mar 2024 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711612662; x=1712217462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+F6qq90RMnVCx2dPk6+bOFn/UT39BJkerD8BiiuXch8=;
        b=OjmPXOQwvkr1To7vKvbxS6A0qjHAl2iyeLdjaN1XrbX5ZJpf5eeBBN43Tp6iwVtAn9
         eZpHZ2mpIhrmR5JPjShgCi0PG/YVZRjUeSgr4WmkUG6ba96cvN3oVQID9QIgyX/gTSYX
         s35oFUFDgs4kxvAsvViDbi2oS9vBhw71SSTN0Et+5uTvpZNU/G1bhYy5uoTwa0AjSU2r
         N1zKnlGnf0eVYKquzMblJpQBTzKdMOw35cmsJGwGR8OWFg533iRlgHzcdCkps4QV+kvI
         Tmh4AQOL2DFnk//13YHdfXGpjk/K0FMiPkQL6k+A17049QjbB/0SdPMmc1F0hoEC2yM2
         RtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711612662; x=1712217462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F6qq90RMnVCx2dPk6+bOFn/UT39BJkerD8BiiuXch8=;
        b=wKfioOEX+gfB5Fv5fMoytrYxOxj3o7X5jeFgaN9+jlcmyfPNCgcQxQ40M4rlnmGPxt
         HMIGKaCfv+pqhAvImU4hTC7ZPpMQhjNVZmZ24EIrL56NKaZBps9lxl5wlC3GYK+eeZxb
         UxPISfGUpChsEry4bEgt76C+XommcQJPXdmMPCvsS//T+ymr99Ob50CxoECApZ4myeO+
         fJxQH3KlN+7rygnBYHc8aOjN0jNa94ENT5SIPXyBzBqjlNNOF3EXEeR+t+B/83/QgRsa
         XrX0wiBvB1lxhnJpxkYY3hFMe2otJWpBCO0yeZ8TYdPX43jPM6RMKQK2FsQIVoqsdZMq
         0cDg==
X-Forwarded-Encrypted: i=1; AJvYcCUasGKJ/7xVFOGyTF24qr9o7ARFhFjapRucnQ+RtkwbkM/EppqIizdUf1nPxwYx9kxe7+BMNVhbBZwl+Q5uZtQGbvn3H4yNPy/vrAacq26K9B3U+mire5tkdY/S4Aqqw9akglYTmFCYtw==
X-Gm-Message-State: AOJu0Yykjq9jUyjCVhoqeWy0XZRocBl8tVgtYJDVOibDTDClghpl7w/J
	3IZeb/pXdmDkSDWQxyqSMHdNPGtrxlwTsOZDXaocVRNKIfs8/jiw
X-Google-Smtp-Source: AGHT+IGiBRtSJtDnu6UbHS1g8MHEybRdjuAtJdLHL0ZTChFAdRKh04+ivgfCmx+b6fiHJMztR/jELQ==
X-Received: by 2002:a25:c381:0:b0:dc7:483d:5903 with SMTP id t123-20020a25c381000000b00dc7483d5903mr2103362ybf.17.1711612661964;
        Thu, 28 Mar 2024 00:57:41 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id q24-20020a656858000000b005f077dce0f6sm644922pgt.31.2024.03.28.00.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 00:57:41 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:27:36 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: alison.schofield@intel.com, paul@paul-moore.com, mic@digikod.net,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <ZgUi8G3q0DvtcIQH@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
References: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <2024032836-grief-parish-88e7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032836-grief-parish-88e7@gregkh>

On Thu, Mar 28, 2024 at 07:08:04AM +0100, Greg KH wrote:
> On Thu, Mar 28, 2024 at 04:55:57AM +0530, Ayush Tiwari wrote:
> > Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
> > struct landlock_object and update the related dependencies.
> 
> This says what you do, but not why you want to do any of this.  Why is
> this change needed?  What benifit does it bring?
> 
> And why did you cc: the staging mailing list?
> 
> thanks,
> 
> greg k-h
Hello Greg,
Apologies for the errors. I will resend the patch with reason also for
the changes I made. Earlier I didn't mention as I thought this patch is
regarding an Issue from the Issues List. But will keep this in mind from
now. Also, apologies for CC the staging mailing lists. I won't include
it from next time if it's not needed. Thanks.
