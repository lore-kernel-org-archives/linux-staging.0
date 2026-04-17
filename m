Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B934D382
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403532; cv=none; b=LDCxe8e2Gxj5w89l2SscIBeHsv6GHZPxRX0TilrEYdcEsdxR8Pt4VsNP9/TW4OsTLqLydgGl8mmfpnSDGWQm5UmoPSPktmKXv9AwF8u/G6B0fJNUnododJBSh9705f+leX3y95q5rOfwgd1RRUcTbrpdYnTrnnAvb5Ua3BN/zT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403532; c=relaxed/simple;
	bh=ewSRNKHD3tCT/saduSwvvYMg/lug1Tof1ThFhOaIBv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVlJgjpBF/2DWOoH0k7HoPAvlqGj6yTt+7CvKiK6GymuMSocM1yTy6yHKBb4JVJ3iv1LNv0+uF3dzT18dDIRr0t2ZJRMpnbdnET7LXCGdVP1Q7Kj5uuT3nl9ddfb9LHV1QBsXjzaSr6xArikGDZAnUywchAP1Az8dYJcgzxgDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXtG/S+y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXtG/S+y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488971db0fdso2828875e9.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 22:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776403529; x=1777008329; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBOcs8If319sZczMI7MZUp1nUcUA46ONaU7CO4kO+eQ=;
        b=cXtG/S+y8er29+qOFH51Z1zLDdC7bPj+NzGOKStkRVpqH5+lkRIc+MghO7tTW+EFZN
         IEMgOxToBW4X/QTIhi62Rls2TUtpO67EoTXiIwFqIfqDbTWtEL3+L5alHEDuMcL27Kw2
         2q8P0N6L4TJfMf4Sj/gbBdduU9cwq41eW4rITu72G1qbBoLMppiekBY/DNVohTWdSywv
         6UhI6nEBPrF4ug0BtOZHmdJXgN2Pu4QV3+aFJ+e3YM2zYHXMhjf3iRmyt8SaeAL2/sIL
         CmIGOD8oSkeZCM5D7W93dT6PEdcmw6qTxOs6PanzMi/sVOzA/DCxCr+P5M+cr4DuKwU7
         Q45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403529; x=1777008329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBOcs8If319sZczMI7MZUp1nUcUA46ONaU7CO4kO+eQ=;
        b=BAoyK45YHb3HfC+Q9izBb9yKr/BWDZZhNggJ9wxTnGWV+L0z4r5DvrOkfH7mZwRpUJ
         ydTRCc+WGHm+hqxPXJf3OEIU43OuuRD8dTjkty9xPLbaWEfEWFCs8y8idnsYEjuWRbVR
         2+0Pm8uUW4Qd3WUoJoLFaPmYQrnWUStlSfExfg+VD0sn300HPCh2lV2iOPfuI3NZqQmH
         ixDNd/MQYA0d1o+7HLjGw4MEzZJMwGxm4xqbo0KrII7iqfDuh3/oJ8sX12Al2H2IUdMd
         hAakk8R3yQvtZrY1FdxEipxZ5wUBMICr38fMYHz7IWg8zXvhXWlS1FaSZgna2dJ5MWVH
         GKdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lHT9TX0+fk0tMLEXIcHQFclSuSzhf0sijdce5VfO2T8RwGPjLmoQltSvtgCBUdL5/IMA5X62MSFc5XNLf@lists.linux.dev
X-Gm-Message-State: AOJu0YzVsRhRJp+KdCAwzVQUs88+IjapG0/1s1gNk5yYkmvq7zBGGIRS
	rFjX5YmqW/0bysr2kS71vRl05s7JBI8V0hxFMXhQpYrAIkhozf8vRwA9
X-Gm-Gg: AeBDiev3yub04tWFGMP74FzB2Q8gPyG5JVHRnh5TzVY6unTJIrec3Jbd8WV6/TAh+tR
	kGYiES+EQA0LR1uzBxuPdorSIY2dPIakxfvDp65sfJ5bbPsGhMTXhKOZuDG8iYkkvHoGa3+IKJ1
	i4rg6eMgBRPSbvGPWSfcoD80/gik+KUStTmx7frs5xxplIvEqzSIGEh7NPLl/9gZh5k2vDCPHsy
	K6SyNPztg8vbrbElGWJfvE/101BDAuAXkMYnuNpqWPIHd9k30E6NZqLS/K7btjiPqnMCoqF03cC
	r4uNmH8LAfX5ax3l36JxJXk1mfR9KEUhvShHIvtIUrpNbzgRs3fjdek7PYBVwpo5AmnI8tD5BMC
	UBpYk1UvUW51PKmBzaCrIdNk/ZuDNQLdaJfqDOMB02d+tUwE7KduZgl171dpkiuFhf8TAuF+HCG
	5IMeLVDkXWQyNVe4yjpPF3PzkCG0G7jQ==
X-Received: by 2002:a05:600c:4750:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488fb6e7316mr19178335e9.0.1776403528847;
        Thu, 16 Apr 2026 22:25:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc16f93dsm20285885e9.3.2026.04.16.22.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:25:28 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:25:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related
 typedefs
Message-ID: <aeHERE58gSbAe795@stanley.mountain>
References: <20260417023602.112359-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417023602.112359-1-m32285159@gmail.com>

On Thu, Apr 16, 2026 at 09:36:02PM -0500, Maxwell Doose wrote:
> This change removes the cmd queue state typedefs to work towards the
> "code cleanup" task in the staging's TODO, and aligns the codebase further with the
> Linux Kernel Code Style.
> 
> The following structs are affected:
> 
> - __cvmx_cmd_queue_state_t (now struct __cvmx_cmd_queue_state)
> - __cvmx_cmd_queue_all_state_t (now struct __cvmx_cmd_queue_all_state)
> 
> In addition, the global exported pointer __cvmx_cmd_queue_state_ptr has
> also been updated to use the new names, and its extern statement in
> cvmx-cmd-queue.h has been moved to the top of the file to satisfy the
> requirements for EXPORT_SYMBOL_GPL.
> 

This should be two different patches.  Is there no way to move the
variable declarations around first and then get rid of the typedef?

regards,
dan carpenter

