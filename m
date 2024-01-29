Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F14E1C8
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706513383; cv=none; b=loxqHxXuezpalcUYhLpKyJF+1GBj+t6c1eYrVX5sekbUZJ88dKWSCsf6hN9xOtQD0Sq+mv0a66Ew+MFEXHzSkkkQCeyD4nFzMqLACaMvx9zEsU9hBukwKdpaMji2xkDV8Ll5nGuD5p7jds2Y0ONCmgx6buqfSu2lNoFY7k6aEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706513383; c=relaxed/simple;
	bh=Jc9jn5Kx2NmcVs/vW6S/Hjf8twBJz4qR4JDcZ6C83/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fwKVDhb20Lwm6avACeVz5Zng4JqFtth8eGjVzd37brpJyvSRPejZoKveGGkx3ejs5uk3TD/3izJvuU4jP+waJtX1Wjo2Vd2rFAxjU09+n14+UfL9Sl91xBOnWjaIO4Vmngmw+P3GRRAFqFJ6SuIC9x8vpd+N9KpKLyDU42s9OhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A87e/7u/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A87e/7u/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d7005ea1d0so1442206a12.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Jan 2024 23:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706513382; x=1707118182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc9jn5Kx2NmcVs/vW6S/Hjf8twBJz4qR4JDcZ6C83/c=;
        b=A87e/7u/cGGCbbJuA+mkmEg2Towni5YS6irXdfajTyey1hV0ZjreQ7vWQxaDSSmBSg
         EPAwPWz4EsKWREY0BTYFmHjWAV37rQ2FDEuPke6MYNYQRuaJchGVvT/P68j273Y3l17W
         rXR9rWajOIz5nVdffAmRcjX93YeUlOF+yKbZ9Y1M6YDPj8IYqexkhWtvMjKPNcZRpjym
         EJRiUucmEmdmK7Kei98tdEpSEO34ffk27qak9nWzgFpxso/W1ikIYueYcNE487CV5EuD
         m0TILrdgfChzL3OzTNqNKHGw59KadohbZK1JCox+sl8zv+AaVPUnx0Y+2AIISue2hwqS
         9lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706513382; x=1707118182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc9jn5Kx2NmcVs/vW6S/Hjf8twBJz4qR4JDcZ6C83/c=;
        b=F2/A3IESLnCw/NPEN9s/GOJEYPxw6/dcEef1xqlFenUb/MrzBdpf31e8BtemOnxcOJ
         P4Qs41D93rnDV+LSsj+FgaDmcwQu5o3STp5isvJVNX9lWcC0p7oG+ZPEjvjcXH3uqcu/
         lDpN72o4JrFybCeG+Y6JSw+ArZIPEGQfqKoPbqSvKCPw83uK8CJSvCirlo5+zWG/3bbn
         D4Nu8yMBnw9dbZodejYOj7b6Ek5dXn24ktjoXKIgg1yseqHCsjVu/gRfC0jLh9N1lXvB
         6PmEJO46MUgi00wCzkC07wYmiMTV20FpuC2Hd1WHvaFIPh8Sc8K87KxQSqb9Qm5SZ3ot
         7Ltg==
X-Gm-Message-State: AOJu0Yw+WPb0lunCGKRDYASPHUV/UYEnoIQeTDUsFGq5nQCP1IEwTmmb
	FrU1+5LehOopO7LbUG2hmqiktk/W23jdkvq3Yui95uMFrCUKz/Bd
X-Google-Smtp-Source: AGHT+IGGTBO+r3eRZTFlF3sN1pAYGUMy9Jx9OlnDSVJHQnlJLn/6GIgPdJD+ktAzomESSLxfbBW1/w==
X-Received: by 2002:a05:6a20:9e4b:b0:19c:9c76:e9b2 with SMTP id mt11-20020a056a209e4b00b0019c9c76e9b2mr4376473pzb.13.1706513381660;
        Sun, 28 Jan 2024 23:29:41 -0800 (PST)
Received: from kohshi54-ThinkCentre-M715q.. ([2404:7a80:c880:6500:a374:2c9:8d38:9a2d])
        by smtp.gmail.com with ESMTPSA id h8-20020aa79f48000000b006ddcadb1e2csm5166597pfr.29.2024.01.28.23.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 23:29:41 -0800 (PST)
From: Kohshi Yamaguchi <kohshi54.yam@gmail.com>
To: rdunlap@infradead.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] doc: ipu3: Fix UAPI header doc warnings
Date: Mon, 29 Jan 2024 16:29:37 +0900
Message-Id: <20240129072937.51850-1-kohshi54.yam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <621fe651-8538-43d5-a797-c1e66436b2dc@infradead.org>
References: <621fe651-8538-43d5-a797-c1e66436b2dc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thank you for reviewing my patch and pointing out the overlap.
I appreciate your feedback.

Best regards,
--
Kohshi Yamaguchi
