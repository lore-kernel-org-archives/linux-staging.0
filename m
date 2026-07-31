Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7A3E3167
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496825; cv=none; b=DUAGFKF1OvjxcLFWWRXnZcdOh7bTBImxk5qek25xRDl87aMiwaUbAkFQ1VhwwHg6yueJ8kAJ1eKZ4NvDSVZk4RHpWTtxnn0zvrmG1MeuXUvis5PTdiAEZsLk2hMf2gO49NRO+UFLV8nY5M+Qy57omt9Jwm7L9RiDuXMPMYsfGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496825; c=relaxed/simple;
	bh=Bq3Ywgc86DledfdQMuTfMx1iFtuwK8Szvs4VwRcgD+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEDsnxl1gXJuGNp3rF1VPGiEwHFJzBfXJue1JBpLIhpsOIkKYs8CzaTZeZCya26rPIwTNc7J35ZBU++PNPdX42ZxqyYw0TNOpG+aa5J0ZDFCRLnM1Dgute6AeZMDAbjzkuTABf1HoPBc7veYn+0QcGFJI8ZiL8ULHtzAjoyST0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tjve0Srs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tjve0Srs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so1540620a12.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785496822; x=1786101622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpsaKTs1fQyHTTQ7IHSRoMDnLkmSOTdMspucVX9efyg=;
        b=Tjve0SrsVVdOGx5lHRLxUGUeYViDnnxaAQ5mx5BlpouY1t7LRS0dL1BWKPzTRKllpm
         toMxg5dDGdqjKqwXTV2oiGpk6o1+aPQuTbaiL70hW8bi2C357/3UfA4zKrI8P94w7/nM
         D9UyDXViI2Y1jzIRvMGr1tPW0gDgl/iLVZpx6R4Vqws99QbZXqRtue+M1JpPBiH2aW+N
         YaLU0tou03+C+uh1ADEKofYt0H1GlwiDQX0UfPCV66Qq0V97ZRKVLX7uDNCutkcS7NgH
         /WMIN87FAyE6Jc0DiE7kyEYDKOkIXbLJr84EPmz1hkN28sCOyJZjJEMxELY8kaoXs8hx
         14cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496822; x=1786101622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpsaKTs1fQyHTTQ7IHSRoMDnLkmSOTdMspucVX9efyg=;
        b=UYKjvl8mOoclPKkzzNKezmWc7Vb1BKIBsxRFWSLGAyWtHtqNX5G9789OqKOv61NDbJ
         RP+JTcJ2FZr7vNw6NyrSEfmEkJJtMx4HMPXUshFbeh9wKpDJHTkXgpRU7cxGv4ndlPnN
         6eeEhHyIaIg9hWv8qmbKQdan1sjDgaru0hztFEyPdQN1Q9Sp045iwGTxEQALBG8h9je1
         fpg5qMBObz8XjXrtp6CnR2U+NMHP2MJH3rfEmqIjHgXrAi9BvkY6pw+9RjUi6K0kAm2e
         jwgjBJ8JYaqadQ2+Ih798+vtYaUnNBZfO+iU6HQaDxHaA03rJIIKE4aU+RZAebPgSwZI
         E3Nw==
X-Forwarded-Encrypted: i=1; AHgh+RrGh9DtySkT2qYCPB6Bq4HAx+z4KP+z5LoxWh3xD7wk95ThVQETdEpVLeF2HYuk5Bp3vM2zQj9zuLLsoZuH@lists.linux.dev
X-Gm-Message-State: AOJu0YzdynEVNTy4FsFltZyC2BLN9d8fHn7TKQIUl92iwXeUHnzFIwey
	/cI3UKs1cyUWbxDZejPCFlkwmhvRX5DHMcYe9/VlzXdtUExB4kWlkhXx
X-Gm-Gg: AR+sD10B4YgLK/cWWfaO15mjQ4ICE+50OlB5nns57viarRPYAlG8kFEfm7jJBuWOF2q
	3OZe6LkB2qELel8kDYx4IDk7KFZ6FMYbiD1/x9LSaV6HZtA8kljhvWvHDnDdlsntaxs6EgjdPEO
	MjRbbmKXGxI8xU9jI6qNKN4XoQVIH380sIfga3hpLQphJeb+YFLqWzBuNTHwy/8WLSXRCcccEB0
	ID508yMb9A8o0ltRV7J+BWwGjmLe4KR4/C5Hj/6Ws/0d32nyiDUjA5xsA+UDhQj2XWhxPmif77e
	VbYaDUmiLkmgCrHMJ27P3b9mq1NYwyo88qYdPi4GhxiLn1iR5faArEovsxrkQ7/Cz8SuaZ5lurL
	+BkW+E2CNQIRLn4UbDuI2XYAiLWYk8syS945OAsm1ilaatVo34P5NmyyTVELtP9N3+k/oBdy2s0
	tfF/Jq6MBWJcSvlP/+L0zuB1nS+KYiDwrqWbzkQYIt1/fKMxxeELMHNUwCfbP7tjbex1s=
X-Received: by 2002:a05:6402:52dc:b0:69c:811f:8f5 with SMTP id 4fb4d7f45d1cf-6a0984ca852mr778349a12.6.1785496822488;
        Fri, 31 Jul 2026 04:20:22 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5b1a15sm1232514a12.9.2026.07.31.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:20:19 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:20:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: validate tx_fifo_depth from device
 tree
Message-ID: <amyE79UWeR-8Xbth@stanley.mountain>
References: <20260731000136.96707-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731000136.96707-1-skunkolee@gmail.com>

On Thu, Jul 30, 2026 at 06:01:36PM -0600, Ivy Lopez wrote:
> tx_fifo_depth is read from the "xlnx,tx-fifo-depth" device tree
> property with no lower-bound check. It is later used in
> axis_fifo_write() as (fifo->tx_fifo_depth - 4), an unsigned
> subtraction, to bound the size of writes accepted from userspace.
> If tx_fifo_depth is less than 4, this subtraction underflows,
> defeating the check that exists specifically to prevent a
> 'Transmit Packet Overrun Error' requiring a reset of the TX
> circuit to recover.
> 
> Reject tx_fifo_depth values below 4 at parse time, consistent
> with the existing validation of the tdata-width properties in
> the same function.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Generally, device tree data needs to be correct...  This value is
normally 32k.  It doesn't make sense to check this one thing when
there are thousands of other ways to mess up a device tree file.

We could merge this but that would make the AI think this is a useful
behavior.  Instead of that the AI should be updated with correct
assumptions.  Or we could create a more complete device tree verifier.

regards,
dan carpenter

