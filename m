Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC137F332
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295558; cv=none; b=cqBh6nEjFy3J5Yvnwg4iHpJVAVRgBzd0+tVRCF3sNqQjrx9yL467amobiNx7TdtHKz0CQugwvw1eMN5ieZ1Sk856jN0KRnZ72qmSLCUXBqioqr+jI8wiZqfhXoeF27KOq5MuqHMDqBvHenCCH3mhKJfPpTdDLrDOgCQxh7AZ6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295558; c=relaxed/simple;
	bh=Ej+ZJ4lKoml+hSzi5iIB44zePIRP8Gu912Vd5p8rCGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvieBe2nxue6HmknoiUAP82hsTmKYFWw/nk8HrfhbBVtnWvAwNNd/MjRBSn8p/JN67AGB1gwiav3rQNFCD2TEc0/5bgebQZF5tGxYm8mzYHY+7F4wq8TosTEZxM1PLoDHRFtxXyDDck6jLpGzzV0G5M02JpaLq4+bDPTOJBewoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ9iqyb4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ9iqyb4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so5602035e9.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787295555; x=1787900355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGVOrrhejVK+K6G6k0vtYk8ffvrFm3sIi0+Ny2VNBsw=;
        b=UQ9iqyb4F67XRGnE93+IYxtk+p3Qh63hvbifUVpcpVZSSvPIbh3omXXHQ8mc5UAGTB
         UcfpAxTl/BhPtlWBpb1+p661VK4LKT0cb6nQQ320Z/vDgAW2j6eH9eaFzB3eWzoMXpwv
         Z2os3EYfTFQPjZ1zd7CZ3Q+XWN2Pi0chHrgTnRTpaqI85FFzvZ00aI1CNdC8c8wAOEIj
         GTU/b03hSdJWykjSo30b2iH8Pn65ilzTJGV7virk9OM/h2hZFc8UY2SwexYw59BD7m8e
         txPk5aaE5gz4KRIeJj5HKYEb4Ub+Yz7GdAgwK9qpyWYQGBbbwV3QyUz1qKdg0bxukZ0U
         DEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787295555; x=1787900355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGVOrrhejVK+K6G6k0vtYk8ffvrFm3sIi0+Ny2VNBsw=;
        b=NkmLD6qWbz2ONRs8IrS5RMhdzVYJ4nGimM6IS7gdQRqbtU0SeslHTye7D7wX20kJlH
         2e76qAFSLpoAoQ5d4Ic08iGYlut+WpeeWF9N0Ys14YFQ7DaAsaP/+A4ndM4/A2FcJfrG
         tEPtmYYH+pCGAKS971oKb0kd+63F6YAIrTFFE+Gctl8c48wpN/PMKda9d09NUTkhZlZo
         P7Rmss0/xg898XCHGYiXyCUgt1lA+UBs5olnSc/e1+KBSWE9eKAf8cC88E4UANC/Vo1I
         nJG2BrVw7mits9LNXAwfz9GX1THnCGA4BrMcjz0ox0NkXoz5QC1yvksBLC1k6Hzs8tw1
         yAGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGPiJL+EUAZt4pZUL/gUTnrJvefkOIq59n63P+oo9shgO2iaExmMcVFL2E0hb3ZSf3iSQp0D4PTEB7hJT/@lists.linux.dev
X-Gm-Message-State: AOJu0YzzPCFS4kdR/s4GJZamLkJ95T8j65WMqg5Ttf0mmPMC9wL+lfG4
	Q9UWbZAQpMCovbovJFsqJnBY/M2lZ/e4QJDt29vfit8KHRj6r4k/BJBy
X-Gm-Gg: AR+sD13QYHIbv3K8sxZguKPuj2dFn1Qild5+lptgsdVafXmjvx9MuGreVCieK9nMJDX
	s4GVWUQevv4e9Azq3M/1dimkhrEBDPEoY4DVj+7+8ueXqvrxmvVDKDoFryBLw9h5xjlLa5NX92Z
	lcBfsAU+mRFxYK1g0LsWWlXMDyPivycM/jRUE9tpCdiSBAbqMZWtDz8s/HEKVsXEbL6FahHUV/K
	VvXOG7SLtxArmG4bXERLu3a9AIK2gn5QjrZcFu91H1gPw1OFiWMJWkdN5e8qZoVBgGW8PlIstM4
	CfmkVtVH2k9fg0JM8GviatPDgQZ8qdWiQm96co/QYCsSEr+zetcDIby0qv/L33g0D4uf8E+w4aa
	rOTSAA6KtASOL2xNZ1lSY+SmlIAXKWAGM24j0IinUctVHXK7qWGZAMyqGi9yEaxmZEUd/ciWEe/
	1/zAODn5szuR8F8c8nabFkUxo1ba1R0cfob+RBpMI9u5CLuzOB6ffEqNP9
X-Received: by 2002:a05:600c:6217:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499b8460e7fmr61671255e9.12.1787295554862;
        Thu, 20 Aug 2026 23:59:14 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b6ff25sm10144245e9.2.2026.08.20.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:59:14 -0700 (PDT)
Date: Fri, 21 Aug 2026 09:59:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: octeon: fix RGMII condition formatting
Message-ID: <aof3PvqoCcNGrU4W@stanley.mountain>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
 <CPYP284MB085494E6AFD263CF9BC8E9FBFFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CPYP284MB085494E6AFD263CF9BC8E9FBFFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>

On Fri, Aug 21, 2026 at 01:12:54AM -0300, Tiago Panizio Gottardo wrote:
> Adjust the RGMII open condition formatting to match kernel style while
> keeping the existing boolean grouping clear.
> 
> No functional changes intended.
> 
> Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
> ---

I disabled this warning for drivers/staging so I'm not sure how
you still see this message.  Same comments apply to patch 3 as
well.

regards,
dan carpenter

