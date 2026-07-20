Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E6404BC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548169; cv=none; b=p2glta1xSygu3JmAfgONw2aGGKIpnbY0vkw+Guvm5nPJKx17GE7SoDuZ5WZHVW+KuVnsAljcXDzrJVWAh+QlB+KE99ryKKFG/QxdEAuh4PqkxU2ZL9pWtw51HS3DaEyXLuoSH8OeTNBaWO0KurKUqQ6xMx8bDJuBiG9v7PVI3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548169; c=relaxed/simple;
	bh=kpQgwtqvNqqfcKxqM9LsZoSGqgZW8nCIf1+4VaTHB2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cppUtuP/Y3/pTJUKqoNQLxtXopTBZD/2rakJzArL7czbHsTgJuh11+R+U17jajoNrdB29gjvU6WcfUWVHwkwvuFddt2tG1ocGbUWhRZuEQQsNs1SZ7KJJDvqEtVu314xOhfbPjEoupGSkK6FHAddZD8eGS6lZW/FBwY4rhKBzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tp4DE57D; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tp4DE57D"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso3669554a34.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784548166; x=1785152966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWzkp2Wnqm0l9stmCGpc16u0gXSQJW1RvOaJ/1MTuh8=;
        b=Tp4DE57DKI08IZrH8wc2Wt/nvShppnkmEkVD8rF+S9wj3QGV8SP7mic1QHkGa8gnbM
         78FH7Z0gZHMRR9GpUsVgB4GUNw/nDGODYDTuOMWv0wfLrlyAqpk2RzK/T/c1//WjgJTp
         bCvKu3q8Hf643A6lwS39maMpeRK+wSAn5AL4l0PFxy9V1Gv+OhDLcXF5qimu7XNbeNWr
         XejYtcqxUKFy6/eNJVa3Hju/51vZ+TApraAaz8/zN2sUvh+VT16e1XKK22iFX+t4LC+G
         OfcFBKflHBwNhG/uDef/oo9d04IJj3a7E94KjT/i4Wa1/ApLWCkNDDDq1F0FNiee3lgY
         pHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784548166; x=1785152966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWzkp2Wnqm0l9stmCGpc16u0gXSQJW1RvOaJ/1MTuh8=;
        b=ozpsIAWOfM0rlDGNfdCDupmUPowy4iAEc9uetZPCKSQmm9TynZ0taaZbCyjrgM19JC
         A3rHl1F0YLLQbzVNrbc3Sckdim0YaOSDy1kgxlKGaxk6ukzqZlkZNKjcOegoE3K/DrNQ
         fQDdoE5Sg3h0a2LfKjn5OI8yj7Rg/64IxRZ9ZgOkXJ/egnjSJbZi2kX3ty5yg3+vXukc
         qwf7EyG2r5ICAymwWuKN2AsjgN0WXgYQnV/qIeqlDoDCvchVlg0Bt965DFJTYgr7QvZz
         OCnPnXDIcTDe/jfQOQPxHVnLoEWtJviFyouX3KcAGf0agRU1NcGOPIeyt9Lu7agrGIs3
         UoyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsd702OrqIueF4rCPohYg+q6B9ExroBYqAQz+kAjlgW6RBKztdwc5BUIPKdSwzQCKsIca6DEeEfVfRaDgn@lists.linux.dev
X-Gm-Message-State: AOJu0YxO6sJ+0zXdcfunv/y6ACpgtx8FZBy86aTmyC9ksXvALQBVrkpJ
	uVg7S8wDfzvumBVJxcIEfQK2V4ByO1PimWv0DQ61yFpGrPFrqdsB/qWe
X-Gm-Gg: AfdE7cnzKibRbojLfVigKdq3s7D5u4lYN20J4e+6Gi1Bk6kJSRxmjSgDZYo8I6tZ5L+
	DICN548+Ird4j8tykzrJcExvjfclhE8kO4Vo28YxlbcUM5XMan1o/EO5pnm1o0TgdGA+AK4fwko
	VBwecucGJs4tYFb83HWPCdI8/UYkXyGdnoRBzUuOolKdntR/2bZfvaABAeJCMXIZObNANt97/WB
	NeVvQyK1oPGFXaFW44mWQNqHHHAqUugWN2IPSZ5l3n5fEW8vvKCOPBkhLkILeUW6KIUVgKbSQtl
	/I8Pq6kMAxNlxBUVP+MeqkjY/1COqAfJzATvukCY/TX01xzJi5O4WkJKs7Z6lh46SBmoS/a3ipi
	6e0zGeB8KPJq1rUnRlOdpx+SunLMqWZh7MtSP7l0z3gDTb1ah+CaWIMgV7RN5xRiTjBxIBQ==
X-Received: by 2002:a05:6830:4412:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7ed9a604debmr6712118a34.0.1784548166307;
        Mon, 20 Jul 2026 04:49:26 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad94e86csm8007715a34.7.2026.07.20.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:49:25 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:49:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: Remove pad_w and pad_h
 module parameters
Message-ID: <al4LPyMIZ2F5EElx@stanley.mountain>
References: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>

On Mon, Jul 20, 2026 at 04:58:07PM +0530, Prajval Chaudhary wrote:
> Hi Andy, Dan, Hans,
> 
> Thank you for the review and catching this. 
> 
> In this v3, I have completely dropped the changes to the debug 
> parameters to keep the staging debug facilities fully intact as requested.
> 
> This patch now strictly focuses on removing the 'pad_w' and 'pad_h' 
> module parameters and converting them into internal driver constants.
> 
> Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
> from overriding internal ISP hardware padding boundaries. Convert them
> into internal driver constants instead.
> 
> This partially addresses the 'Remove unnecessary/unwanted module
> parameters' task in the driver's TODO file, while keeping the debug
> facilities intact as requested by maintainers.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---

No.  The real answer requires is a bit complicated and requires
some thought.

regards,
dan carpenter

