Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58921D5BE
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801967; cv=none; b=ls5TvzcrVMHyqd5ekZP5Gcn9rNrFRpZt4k2fT4fQW3ewvPX629DHHR2yPg4jC/3tt2Eu3NQrp1JSd+T9MxBpJQQbIHPhdD1wDD0Ktm3ISTk7OYeUuPvPVlrBFfZ0YVJdpHlAIecwLiZZu+T+uG39yBYqabU+bUDvKfzVEyB/dB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801967; c=relaxed/simple;
	bh=f+lGY3bRo6/ZlhAWhfwDJ4lK51LrYKEasKvNJQ3CAN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSyU4RhZjUBaNfaadsq0zEu61HgU3cUbPQfFRmo30CSgRG/LJV37rmQ7ZFtfAj5oXT4IoQwbUxUpOkEDxvThE3q/y2j7gA8ykNHhS0MpMHvMaAdUv6k7brYfKnadg7XXcRkenmbwQ3tOaYmUsZNdDMAGNLljvhL20AJ0UD1h5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1NnrULI; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1NnrULI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso1961149a12.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 06:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801964; x=1740406764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zu4oJ+jaqD1SJBOCWTKei1kl+R5dexP/eMTe6Jc1Gjc=;
        b=o1NnrULIDTYx9hJzmzhk5pNqtjLxTnM/b9mE1T59O+HwQFrRgTdFLhDaQ+zQ8hkH3+
         IFkS479HxpNX42cp4qC5VDcjYN+VBRX4aSY+Qz9W95B6fbvLsgfZW3La5IK9W8BWVbnF
         xlD/6LASjoi7dMraSCFdTAMS4y6577i2XLK9sr6EDUG4NPhVt9mnRNaLlqYGUDv8TOca
         LE1aKNwb5l97hrQDbab6hiwRk/gzrhr7HMky/CctKIO/MxO3FbxPEq4+y6/eKU8OR1cN
         eCyVxJZokyhscFOQaiawfH67780gOdCSFManbz/WV0p+8eBQpheEeGdSr1xzhcN06qn9
         3a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801964; x=1740406764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu4oJ+jaqD1SJBOCWTKei1kl+R5dexP/eMTe6Jc1Gjc=;
        b=CdSeQlJRTy0eR547mVOtDEIwzhtoUxDxD8TQkRm9tyWBV8oF1GxUHrqOkXrWqID/iv
         oqaum/c1bWnV+RGK9QnA+jGTvWerTi2Utq5Skr9lK+7lx2Yr9vjBmmcjagNGMEV8Hhye
         b8wmowYZv/CVOVE2LLvkMlc1DSNIYrHmr7rdfvH53eSEKsLPBOl9Nr/XlnNnPNXCVmKD
         DC56PE1TDLIuVMOVQTtQPcyxWl/ZkiYLvxqgXsHdwJmPNcheafFJmX63jCUfmVJiCfIl
         7iDCmrRej7Q78lq1AUU/ozcqqSCg462JVUByV2vbQR4oct9ss4Xm8+HAZVWviD/ZMW/y
         etdA==
X-Forwarded-Encrypted: i=1; AJvYcCXqkLJqGyuJdVSC3FH02vp5INlTVz4TcWy56oU2s1VHaZbMUlnQoUjwKoYF+AQnPPDpB5VeyJUVIpMUqGum@lists.linux.dev
X-Gm-Message-State: AOJu0YzEDKFUDVSrT1XXDPkvEfxcF7Yc5HVOJWMcqyZA101+q/fC+m6x
	tY/6p8EIBl/yc+bUONQqPp4Fg6Jf0MOXSfCycxdBERylot2EA50yI9YHqH80UxfmN5yCzdmMv0g
	c
X-Gm-Gg: ASbGnctyaOPzf2JYe/XukFvZn0C1HtSzOr3FMWMzDhjHdBWRfcBG9G4BE2yBraZzUAs
	dM+BAfsZvvqlQIu54N8JEdYjB1EYfy6eHawDHU2Ge/3vWi2QUVcI8JJu5asyngivMIonolTxdjb
	IpSAVPG/oXFlbA+oXMgUhEh7VkQdhVgTU2Mlyky6LW8c1X84/GP/baE0E63GQTmHxf0S++QMNq3
	0Y3AbGA0OFHoNaK5VX8Sot+U1Whn1G6cTyC6rAZKlwIU0Gs3P+zp9tw77v8euQrgV5OohLFTMvV
	AX4ekhsgnFEUp6cujHip
X-Google-Smtp-Source: AGHT+IE8w6imfFH8KYgZ2tawwP2DiwXKUkUiNLxLFwschuBltQWRjocByVFunBs3ccNxbFC7TA3z6Q==
X-Received: by 2002:a17:906:6d04:b0:abb:b092:dade with SMTP id a640c23a62f3a-abbb092ded0mr66067766b.38.1739801964594;
        Mon, 17 Feb 2025 06:19:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb99fd1983sm224140966b.108.2025.02.17.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:19:24 -0800 (PST)
Date: Mon, 17 Feb 2025 17:19:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kuba@kernel.org, rmk+kernel@armlinux.org.uk
Subject: Re: [PATCH v3 2/4] [PATCH V2 2/4] staging:gpib:agilent_82350b:
 Removed commented out code
Message-ID: <2ff8f3f8-e915-4ec0-80e8-fbc87c8fd1b2@stanley.mountain>
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
 <20250217103046.54294-3-kumarkairiravi@gmail.com>
 <629f57dc-d6c7-48ca-8b05-f1d0169eb454@stanley.mountain>
 <CAEEw=4mN+Y8G6a92baCH6kANcpmTFDzn_LSS3XRfXAFdPZxo8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEEw=4mN+Y8G6a92baCH6kANcpmTFDzn_LSS3XRfXAFdPZxo8A@mail.gmail.com>

On Mon, Feb 17, 2025 at 07:09:23PM +0530, Ravi Kumar Kairi wrote:
> So should I just do the whole deleting comment thing in one go? Instead of
> first deleted comment and then deleted blank space?

Hm...  I had to check.  All the issues addressed in patch 3 were
introduced by patch 2.  So, yes, combine patch 2 and 3.

regards,
dan carpenter

