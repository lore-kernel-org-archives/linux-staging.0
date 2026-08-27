Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE4D4C8FEC
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854774; cv=none; b=PdPNyZ9MqSlnoEg4kgGmeyeEE5nyGrO9yil/jxCTomwWKc1tEHCOvKEiokoGHqG+bSE3jzYrw/6g1FIn+zo5mML2/Vc1as8KdErhHZEa3IrrPSCv0+NHsZ3RzwuEXQb0Tbrx9aglRi776KzG8h3D9QM4XzUN6D5im5L/trB98fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854774; c=relaxed/simple;
	bh=b00El0lY+1vglMoXPEaunV+c5xkWsWC2fZx+ObgptIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJT2H43vmwT07kBYlczumuR+ixidxntZFRzQyqcIAOZhcVh367R3KHBRkHLFOiu/j3EK0518lIj4ObU8FlFeX4MYcdgg2meJ0zrLx0sHfrRDPqSz/J16zqG1xPlxSWBUE+2gaUkrjggZx7GFUAsAhjUHl0g6YcvJVwt/zjRHsCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQV3XLU6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQV3XLU6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47db714766aso986764f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854766; x=1788459566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=UQV3XLU6JuUG0JYYt8IsLyMBaqD9p4+qgUWtivonQQRMAkayHO25uogCQ974ObNHZG
         I4KOONO2ie6qcMUDSMUfGKqWhoVdKhlsOuguWPvfuvKiveJReApCEbYFPgQgfZXzh6Lh
         SaYBwan+Yclqffwt3/iLhV0xenKeaSq4PlWqUE6mMvzAD46mhcFziuYJbF3gfGdAik1a
         XSNjOeAjq9kYFxRYt29g+Ya7A46zcvEV1vp33cQZT6vl+W3OR6OXDO0IxFThjZUkSQKM
         nkNPAorxAxjnUQFm2kohanKWp+nCfg8EY+zMyYLNZmnUN8B7HpgC3T+gHTrVujqMIBAS
         Awdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854766; x=1788459566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=cIVlGFrA1uFFYZIf2rKQNIFIe8paoAT16rCfIeOc4+Wr9dLvq5Mu+oQE5+kzBtWipE
         wjX9W7Za52thNwH8pkuzsE0ystFuuMUmXIT5Y8jtFc/XT9rlyjFuVxftx1KBC5b/C8HJ
         eETmD8n1AdgN7GVrrjhFllSftLGT7lBOWabSIlmE1F1FMNVVviFujyG+MddqJVdqdJO2
         cL57QDBXhPtgekbcaqHvt/0gyu72xA2a3t6Cpy0iiU3tdBNM0WG5DBC5AHJZniDXbgfw
         opP6XsMpHF8SMArm6jepOUlqfTHGZozg67srlSPMLSBZdtgImgdtL0jvInGPFDM4tuAG
         J8cw==
X-Forwarded-Encrypted: i=1; AHgh+RrPVK5lOTUI4wqeXIF0Qz39Hgs2txRiMwxf55nva7qoqPMTu0elWPhmvck9lL4BY3gK7mFg0+6K6miI7C4+@lists.linux.dev
X-Gm-Message-State: AFuF++lM+Yg79a2aXLuWGhZBVyrdLd/Uho+po6BsX9QHNY74OBz/9Vdj
	khNoBBGpVW+i7blGWFq76QopT5wyI4uDia6ETZWhP85znXhL1Mu2pkd3
X-Gm-Gg: AR+sD13bzmhcJBzZay7WFrRdJdtFVE4X513Lw/rlNh4lMqG2wcLJ2HpdsKIC7GCmmXO
	J+hkErDHpHHhACGUGRQlK9CYIFaBxaY/4tHCgzZ1vbHh3eBrubCi6ZLZn0RjbBREW030SHYsQNo
	PLqGPNkuQ/AExQMHwudACTLCpDTAmKSWGnxpxf9K6as8dsJ6X+lXkq3vdzSOWSdmKd4QBl1zyPw
	t+wlV8eJRVQj/dYdgJ7evjDmh2dxWn1TVASBxvZehvO+38NyfFTrKhAKiU/+afOgdJXQwnuMUZJ
	Zn1WWt+zooRilZ1myN2VkHATbbSu9aKPwAFF2GGWvoPEfEklnxsVKDjAoeyrGe/uivbNttEtATW
	UEk+CF7kKpweLI19+mcA8Q/WB3XSvTtLms3Y5VDiZ7mXHv3BJWSmcHW0Qm1Q37N6irIuFS6TqZ1
	KYQ2OanGjsbj1sOCLApho0W4o3TbFo379o1oTdqG2Lyv4h6iHQ5iWqkKg2ECNoUY6ERjJaurweo
	MyyPzGTJvomJOUIbDzk8QNX1e5WP6FC4WoY7m7aEEZj
X-Received: by 2002:a05:6000:4a1b:b0:482:e4bc:51a9 with SMTP id ffacd0b85a97d-482f75789a7mr1643068f8f.4.1787854766117;
        Thu, 27 Aug 2026 11:19:26 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm11158603f8f.11.2026.08.27.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:25 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Bingbu Cao <bingbu.cao@amd.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 6/8] media: ov2740: add manual white balance controls
Date: Thu, 27 Aug 2026 20:19:22 +0200
Message-ID: <20260827181922.2432231-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes, the three controls need to be updated together. v2 clusters digital
gain, red balance and blue balance with:

    v4l2_ctrl_cluster(3, &ov2740->digital_gain);

The runtime-resume path also applies the clustered controls after the sensor
is powered and initialized.

Thank you.

Maurizio
