Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010559;
	b=fEFRukpGTMd0PxMugum08dMYtZ6m46oCFTCQUdswUsqflMf5SvhQt2bLkWY0pMEnZMnn
	 MZQ1ExjB+4+vHYFDedWYQWCo6PnpMUM7yg0jFvPCs4GTea/+SoF4IBrkLQMLmECdIzESC
	 n18yrwZmM01HWzy+6IsqRIv83D8vQyuk2vgdacHNZF2e9wbfPGPk+1qRRHEwOlLKvOg/Y
	 1EpzfsbPoEEk2my1WT+hehbq2tD6V9PGpA/i8rzYG5UQp+NMXrysNoc8GKqvpZAAs3gh5
	 oOOwIImaZx1QHMZp64cHS011mtwsB/QCceq82OTECHeBbW6rjTqiMRnSB7eiXVbe+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
	b=xtntr3y0p9vAFgTJbrNOzhoFjUoyjsipUuwSpEnge2Svb5Y/jvoCYKonnVn2dvFzU4vM
	 PscmWb2FbHqP+dKsHut+dQgbFnDpQdFIjZpcEzrNgcg4WY20AfVk+3WcdubhO3LkTcEmG
	 Nzt6z5vbzAGsAusCmqWFnWuBNXuaWtb3ASbvnWiIsdL3N048T92Yi1yO9OJVfLyil9Euq
	 nh0UuIaoBEX8QPC3OGg7uTcSl6Q0a9+dUbI2uMhev8wb/xtrKoY1fQWdgrAnwYQhKBrrt
	 cT9HLTM2Hnl5PSgU41yT6Xv8I7nNkdnLT1Qo6erbvmZB+4QsUzQnClBtsy6GTVnJb/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=riqMV376;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EF606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=riqMV376
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c45111bebso1250018f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010557; x=1793615357; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
        b=riqMV376XHGSCMiWes3dtH4dyT5i401Wmf0M7c/8D2OA0zotlE3TKGy+EXpAFb1yE2
         phfGb2/bJb3BE4HlNFbFuuSnmLimj7Vn3xuIXe1JQHXJhVmRp6ng8D/1IH8f5vx54YUy
         9n6BAyFOOAX/M8+JTGFpXacrnxBHZyIhcc8D2EjU4rtoil/SV/yJQrROalbPJZIVGys+
         s+ofE3L187t53d2RuRZWLGvr6JdB+Js2xT00QUV2Gn/3Ov9Ja3NlgC8QMTuEeGPgtdbG
         1v/HihtdLHnRSaJdSiUKrKEpxwPPF/dtynny9N3n+Z9/3RjmPZPKBYfBLq6GYZBuqutK
         ubJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010557; x=1793615357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
        b=MZXvr3Ge0/0wXlstukgwIn5m0122uYYGDjs0ZQnKml/Wz6G8qiL5mfQE+hOtA4P745
         5BSBXxxMt3sSIf+dhG/l3dm4GS/eik7v89r8w2WWfqy+BCCvpR89UDHyoHYWTsqUccx5
         9SJ5ceOuys8bDEbReXhA06fiotYcahhDLd5QpQSQ0/mx4cipENc/QzNH+XN1QBZ7eW0m
         rp64t2d2cWkDPpIkq9JEK/l1/hTI3B++OGaxJpRHjsyelqz2uNb2Q7X7SjoWFur/hkPM
         VeWo7I1cHrmQYnDK65VXppnMIac56Wtm4dd8FZEkPKAtRBzRkyHW7kF5wAkobFx91NtF
         njSA==
X-Forwarded-Encrypted: i=1; AKwUvBwiwxaMZRENJ84X5FOPkx7+1DvLT3XgSMrDt96ul0v7Dps24qJ5nUV6p2C/yMdYkeHtfrCVy9WBEisCQyh9@lists.linux.dev
X-Gm-Message-State: AFq9FYKgl9UNuDuveBI/oHxwsfKs0WPqXVQ6BmZilzs05VtWbgnSZA9z
	bTKIHPYwYJg+SIoUMafM3jMilVnEM/8iLwtapd5V1bHIamQkfkuQzgrE
X-Gm-Gg: AYBFou0Hu8z1VclmBnvJoI6NLooaHtmq0hATgQnvWtAp6f5rIOQEbST+nP2jhsNyjCE
	MvBEb3dLy/EwtU1cvHgEawseUpbPyUOYg/jINrsFv3t73fyy1wgOU88Ah7MCCB9chocFBoSiCwf
	0solQM/NtEDFt54ZDh3vst/CK+MDQtzMzy4i23B1cYbcaWFIyBOejQetpXoEAoMXlgoI08emSks
	vmBAq19DFpBef3UrsfWWSR634YvY6mM3mlGoj0Gamn2OUIjZ88Amu8R0Eku4kRdJttJnF7VcI2g
	SIZe7D0P+Iq9+7iGRjmGCoOtaFY0xSQUztxw/6WURbu0+xyJBgJWtqUMea5WN1Qz74Vd/j6WjrS
	eTytzyGq25+pSkEPpR8MhGg9k5YZJDTHAlDIB8t4/LNLWgOXiATWq6umBC8CB1U5Ky82dIIhrJi
	8mC0CAJg7zk0hds6iEwKMHB13+ppa3RtpZnO4L18+JLUGwT7dklPj43Rt6LRS3o9+k7mPBCrieX
	yVCLGuAqcVAaMA6w6Gb4BMXAELWusFMETp0QkubiWndoh6PbNX8VBOFw+oAIaF4/JSRdQea3w==
X-Received: by 2002:a05:6000:98f:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e3eba5d2fmr12088523f8f.50.1793010557470;
        Mon, 26 Oct 2026 03:29:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48eesm15574100f8f.30.2026.10.26.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:29:16 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:29:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: remove unused fbtft_init_dbg()
Message-ID: <at8reTB8v7iU-IaT@stanley.mountain>
References: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>

Please always wait a day between resends...

regards,
dan carpenter

