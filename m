Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850751F4CB2
	for <linux-staging@lists.linux.dev>; Tue, 11 Mar 2025 23:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741735598; cv=none; b=VnARrwXKdxeBbLE8+yKEae1SIoOudw1xX5L2MN62scid1EmMtPk1FB9ou+teKP3FoZZDqj7ygRPClgYdp/6gVEm91jc12ZqtyjS70a5MFfP8OosIUXOqz6vCEEY4E7fwOZjhs1OspRFUGL3ggTSCwOtA533eclT/HhoI65MQkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741735598; c=relaxed/simple;
	bh=NB9hHXv5biXAPCwiGO2RzmRPnzHDPQYRuFhlhDx477U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPEVij8zomsB+tzPOPPF624XNeuf515t/ijxtlFP8kg+vyTis+HndMuscfbCue/3lRSOlybowB5i4YFa4zfXZ1DbmcY9mIy4rFHZU7EBfDtnTz/MQg2OTphdoYJjfwqPI/jF+YDBMb23fPhq1HFZPYCZeMxRfsY6+8nFLAP/fQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASTPEK6F; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASTPEK6F"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso598940a91.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Mar 2025 16:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735597; x=1742340397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB9hHXv5biXAPCwiGO2RzmRPnzHDPQYRuFhlhDx477U=;
        b=ASTPEK6FfnOP8R2pHQXfpqW0LzZ471kVkMtVMzGaLrNbCqAtfsWPQs6iQqn8HPZfPn
         tCMzW14ChsSvqQX3JzoC7Nrucy7KPIN9KO/cIZUJRjaCzokO7ZpjVoSWVe70+HSnbwcC
         JHOKPb4BcmkZpyIe0inSgLL3ej54FSbAU4fH1pwNkcJoQJAAK5ltEGxv5H4QYDAQSE2w
         yB6q6yKF7XIklrE7hcvLj0Y9mQfy3zHQuCI2gun1+NXjWwjgNYUVJ712iCeC2MfCiVHB
         ufayix5o6CW3NifVY5ERcH9DJJ/oU72VzEiBfMw8MAh7VbdHWtOdpMA3lnT+JgCnqcU/
         Suhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735597; x=1742340397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB9hHXv5biXAPCwiGO2RzmRPnzHDPQYRuFhlhDx477U=;
        b=NZnSksUK8MSfTjrG/+QP8ecLngQLSEDl15p7iwuyWUTNEVtUBMlg94XUdKYoU+Fnnf
         6htDgzt7Q0fGTK74XJpf1pERxCuL2t+qsek0zyILRNuknyKh2Ruzfw0BkO/1Q2m8eNqN
         bacwGTGvyW9ZLfwOKBn5wN1hyS9hMUOO1RpvtlnpCWvcVMDadnxDzB8beGzMpoQPiOyy
         flq5kSdpkKSKvIFyNdDvnf9BSu+tET8NojzXEsvh0oD0crrFxoYMJL8fepUYVpgmpES6
         BimhEZzQh41TDqQFVPtIjfy8978FxJThwokmj5KfeVhL1Lh17hCA7eViEqX9OAcfiDpx
         fMTw==
X-Forwarded-Encrypted: i=1; AJvYcCWkEv3QYKffVJfKmGE9Z6r48FVDZ8p0rRyGtH4qJasY+RtDTXtCCiFX15c/aGryy5Y/iQsLVjGTizkyVQFV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2VQQ9X+c2/K/h7+TFvdKVIs+4NTQUBoVK/MYU1q03NmZoI572
	NlIzEJQHPgQILuH+GbFX1jXluvxV8wrmZfGL6Due0gD+ibW6iWQl
X-Gm-Gg: ASbGnctOcKaMqCsQvIwyTOzUDqOTitrd3QE/7UokcO+rMi7hiP27giVvfU5KKq584oz
	aY5x3Ns9+0IXqrdGvkJefGxY2wuum7Ja1LFdUU74SJzZUo3L9krzNflkfx6/C7pGo3bjKhUkig1
	AI81EWC+au+yqPnQPCoyga58qtwU5e+r4aUx4FI7gThjwDAkwvNvmRNz5tSuPNGOJM1EV19WHL7
	tf60ws2uI631AQWyp9/naz2zM53uFiEAqoGsNzNRxfdLEJTZsXa6iVdvRW8+G+wmJImWvC99VVC
	iZ63MKfHfeH8NaZoM1o0spRbH33yr/G5ETVAnsW8rb8d9u1v99BEyrDDuPJi+1vXRN8=
X-Google-Smtp-Source: AGHT+IHiNhkuocGL2i51iwpj3PetKDkdPdrWYI8h4KDdGMoprBvmAaPCtkiCwsr2Pc2nOtnFOwQg/g==
X-Received: by 2002:a17:90b:5403:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-301005782bbmr6800630a91.17.1741735596542;
        Tue, 11 Mar 2025 16:26:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4ff:1626:32b1:712a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddc89sm104040225ad.36.2025.03.11.16.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:26:36 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	dpenkler@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] staging: gpib: change return type of t1_delay function to report errors
Date: Tue, 11 Mar 2025 20:25:56 -0300
Message-ID: <20250311232625.4983-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <2025021915-scandal-hypnoses-cad7@gregkh>
References: <2025021915-scandal-hypnoses-cad7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can you rebase against my latest staging-testing branch, as this no
> longer applies there due to other changes that were sent before yours.

Yes, I've submitted a v3 at [1].
Tks for pointing that, now it should work, regards!

[1] https://lore.kernel.org/linux-staging/20250225014811.77995-1-rodrigo.gobbi.7@gmail.com/T/#u
