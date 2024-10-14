Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903EE146D65
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898268; cv=none; b=IMQ7WDMXuWVhZ+n1u9O3jLSEgksanc147XV6ZpnBJJNyzgjDltqET098h4Z4UrCN6eWi/pA6bJXLJTLGuLe5aKe3FFuBfSP+cZnW7H0DRVaWR0fG/Lm9RPw7hSsuPk+fj+5UrHwKgq5cdCPHDk2SuF8azrh5qX/9oHUpMZnq5uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898268; c=relaxed/simple;
	bh=10Vh/KXdRgda34P24+FCpQSF7tDiI5LjonUGB1ERa3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1gEQElV98x6E0Jz4+4xPxtWr6udZNdmgVXby8bo0KtQKL7tb5YnvzVA937KeW/MZN4lX9wXzg/BsuIavvVy2aYi0IjwhHqSTrWY16FCSUEBBckCG09eflAoG4z9zEkkSeIIEtdVnm5pdYH6AD5hAvwkV/4RrPfY7XzcgHSsvQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fpWFaOXX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpWFaOXX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4305724c12eso30452525e9.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728898265; x=1729503065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPxfM3/+LHt+EmVnzhLr9Fip6ZGfwtZ5p/tUW2SXXpI=;
        b=fpWFaOXXb1i9+fklD+d5aWEsm3RyweXC7SJmK76fmmktM2xUyguyi5D40Fi12ZtcSA
         IQnzzKMLTcJFB2ZJHyuwVcwNXfLRQcC5EDhYDNEAoPmshOAc5fqfbsAZyULNFaD7IfRW
         0W8hK7mJhIYjbIDZe+M1WMe5fZutDY+sNp0+dFXYHQsuB/7McvlRmeLkyR84M0SHRLXE
         IuPDTei187apaXlf9favWM+IvzoRyjDTQ1sEbrDWBR3BcCLY1s6MkLaToKIgI8d7+utA
         7JgOj2m/2AoflJ1XPuy0fXu9yIumUwpsohDkIAOCPgLwdGdys4krRcjOgr4b2UaTshDM
         IxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898265; x=1729503065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPxfM3/+LHt+EmVnzhLr9Fip6ZGfwtZ5p/tUW2SXXpI=;
        b=Px0HWfSM2egEUxpzF8B2TTy2qQ8bkDponyL056MLw/TSWv6ADHQO73zknbOKoyQevf
         fKnHF0Z1C9XZrVVa3SC9xYJs9vIYpCOGe0nQVBRB4snIubi1Ckol0tKwZRVoXP5KhDyp
         kdYG7qV8eD2s1y1rvnXGTx0HExupOdnM8mgxDtQjIRRa4HJUINN8kGfY8XqjHYxyqDcq
         1Oe1b+zluOpF91uvHynCz174vKRDhqTn26Xiv+8LukoOb81C2vIBMk7AHAj54O8ISGSx
         VFc7Lh067+5o8rOdmCNcxC1yKWaOuxJjDZY1HuWnt4nkZwBPIb34joMNaJtn1x5lhMy0
         6tfg==
X-Forwarded-Encrypted: i=1; AJvYcCUdadqv7O2TJNRZ49qAhow0mpIs+UwUDWj0tFRJXPAekSXxZCXl6a/kkmVIjYP+KCB/9yyvWX7FHpfsnk74@lists.linux.dev
X-Gm-Message-State: AOJu0YzvnwO/rklhAasQrDrnhS3Jjcyt2bh7CCtBw+tctBkEix5BoTxa
	H2vMPSJqKCkVaopAo7YfcOJm8VMHEvT42zGiGf/OlXGi/aT7SPh4y1B+RzsDtjg=
X-Google-Smtp-Source: AGHT+IGJAZ2abLY3A+ePxucwhIPOIPVNEZwYUtaSndGiYueX+Z9ySXWSN9wDAthowcyl1n/MoONv3w==
X-Received: by 2002:a05:600c:190f:b0:430:53f8:38bc with SMTP id 5b1f17b1804b1-431255dcb76mr61160315e9.12.1728898264921;
        Mon, 14 Oct 2024 02:31:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43127a6ae71sm63892235e9.47.2024.10.14.02.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:31:04 -0700 (PDT)
Date: Mon, 14 Oct 2024 12:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] staging: vchiq_arm: Fix missing refcount
 decrement in error path for fw_node
Message-ID: <e9ccca49-c609-4d65-8609-a5ca3264ede7@stanley.mountain>
References: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>

On Mon, Oct 14, 2024 at 10:56:35AM +0200, Javier Carrasco wrote:
> This series refactors some useless goto instructions as a preparation
> for the fix of a missing of_node_put() by means of the cleanup
> attribute.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - Refactor vchiq_probe() to remove goto instructions.
> - Declare and initialize the node right before its first usage.
> - Link to v1: https://lore.kernel.org/r/20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

