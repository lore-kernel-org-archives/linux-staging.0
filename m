Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206749;
	b=w5+g7x6julcbvlr0YWwSGHVzIpWjoBst8R9SXL7pyf9gY2nROWTBj7OQ1na371cNGb96
	 +Mp1JQQIXixpzHuZYhAN5o43i36zakTTmiyj9s4HxREl1ASu0qftUz4eAnAClpB2F2xM2
	 DBv+vwcc6MIobsF9aZUnTlm1W6fwnhfiq3eaAEoB4ZZY00YzTZ6Kn8pBfwqCLVc0D1P9n
	 0wPG9s+Co6ALbTuYgJ9JpF9zjpdahzaT2H4seFJa69YBnHSc0y5LPhlzRyWYqtPSNRc+K
	 bXEIqzoT/9AKbUdXTsdOsXfaFHV5Kl+rLoapi/1ANnVzSsYR2FibqVyK1yWjbEnv3AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
	b=KPbw2bST9/cf6sBzB5J/HY/AeOOZvCY4HG6HWCuWe1N0L856txMpyTe5PM0cN+9wYDjv
	 PhtjMubElOSWBh2G3VQIn/jnacE+inN23LBaBafiOzQf/gdKdup0auQpGUqxHgL7ShmrE
	 EGLGbKKb0dIN8jjOpFxDhOaUnVLQujDixK+MPTUDhIUafN1ec2wsV+y56oWUPVl3jXG7e
	 /UE1jo/AkpbU4pfQ3Ip7I0X0jytZSCM+lzTR2Vq2hD9jf4+dteDKO+6GyRBQnYGHpHMwO
	 N1k5UjaaHT7HB4olj1hPHXGbLqZgJlvEWtdwaq9MmRDhVHRa/8s+qXX8bym4fBYBANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/Sv7niS";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0957606A321
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 06:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0957606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/Sv7niS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491971ac844so454716f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794206747; x=1794811547; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=G/Sv7niSvJOv+cG+qu2lBKq34JXtAgCg3nR/wALgsyo22MeQFFaOvC8sXx39vaRI9Y
         pcM5Qm5GjUpVL3Vt7P9pIAutRgD/9gA0Xq8N4jbEM3rogPG7YwTH+an07e7CmZXLYK2p
         CdNz5SJhrHdoQmTJpySAZZWwqKH87NOsueadroBFz3+3D29K7s0vrHiXrc5d9nfFqnqa
         1zuKwSu+YmR+M9/4/4S6Lqcyg0tYePV6HagLRCMvK2PgjXxm4teFd1mVdhoIjobPEULp
         Ql6YrOv4iMF1G9wkf021izATz1GILFSKwQOKBcfUiVjnPIZsPoXN3yS7IlZ7AIs/FCTu
         +dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794206747; x=1794811547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=QEuQ84pyd8DYQVJfR2CrnUobO4sc14E6+ly/iDCWGDdsGLDdfKps8NG2Jc+oR58t3h
         eYLG5p4ZGxoZ1kULc7UPV6f2dle3hDqoX/lO9y3nNMZVw97SviP3KBHHsQSWOjrFNi+A
         L8wUJNyiiWEUbbozUpbudNoMclWH8fo022R3air4P5f7arnbvoMtZ+E0xZRM2t2MeJHX
         YfykL2Cby03LBY8hrA6MXnPnITNBuAO7fidplN+3Ho8wZIFTQBRpZGs75v6/H0DYR5WF
         2TtkUfzFU3e/ySPzJRVgnn/oc/GYDzOAL4TcPQDpy0OdrYVrRcbHP9Sm+FdJXt+s3X2D
         t5Ng==
X-Forwarded-Encrypted: i=1; AL+hErEf8RUSypiqCsNFrcs7FD/FiO1M+ScDei1AxS1QdeTmPXwko8dd8eJF/MjTAACTAeo1VvDWkSCwi/Xf6IT3@lists.linux.dev
X-Gm-Message-State: APuU4Z8Lka60Nf/Fu53ALCNQiarQrqBCdFdrQjxVcaH2q8EVA6IGuNqP
	lPDnwVVwC796R2QqRDm7jd0CfTKo/APQ2+LnbjzCxO/Sh0BMYxcjrUM7
X-Gm-Gg: AYBFou1sb06g7LQoIo/C51Ssd9g6FWPu19eVkOSqnBGNFnFLuMujVvmMG8C347jm4bv
	9MBvuZbLwZpL+nu9BotPcbpQyyO5VJsDiUVwZDVMoxYpRoSNLyn4a4y81nMOl5RNpG++iQolpNf
	KloJoVttxgfQGISy5wybKUpX7DbjQ8/bWoDAtUgW8oHvfh9HOWvzKEhJBkYNo8waC4lOD4TvYgo
	HEJfuNLIrefZCCKSk2lHO5BSoCWn0KNwSre8AgEKK0dyoWzygA5z5kcbfF/PqhIjFWcNkWTLHaI
	MSNQrn8vcuLJCVzAxkzjJ5itBAFkceq8t49ttFWDdDyepNbnKmw5aWSs/dH6B+Lofdj+7QC6Ni0
	MmRo0uA9ui2Vtkez15gmoCKSGAk1JB/7Dc8rQ52Ff2W4PFbKDOVLQnba8rPKMqd6/FGgCGS4oLe
	kHVg6D3/cWGodT7PXiic9L1/sIIOeUB1RGDbdRrc03vLoJ9vXSQhP2A0EPFwXZW6tOQWWY03DJt
	cY9XFcmvnbIXdp5rOIcsDWZzY7WiIa8VwAW/U3mq5RNUpGsuDfqpO0plULGnaBaZ1r3XDu84jYb
	EODkgL19FtnT4t6Gksoh4OiOTSAAImdRw1PBWLRDvX7RLs2+AkOkXmjRv7DoL/4JqNpIarb4qCJ
	y19o/l/qtVWQqnNkUQja/0LGf1+f0Om7aJDt0+l95Qxsh9i506yRFYUXAjBMvjLDjFvOnJwoVby
	9EGGn7Thfr1qM=
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5438445f8f.49.1794206747118;
        Sun, 08 Nov 2026 22:45:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm7827905f8f.35.2026.11.08.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:45:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:45:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout
 comment
Message-ID: <avFsFu5YzloDMbNb@stanley.mountain>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
 <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>

On Mon, Nov 09, 2026 at 06:12:23AM +0000, Lame Morupisi wrote:
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
> 
> Leave the frame layout diagram unchanged to preserve its
> existing representation.
> 
> Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
> ---

Why are you sending a v2?

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

The lines are not aligned now.

regards,
dan carpenter


