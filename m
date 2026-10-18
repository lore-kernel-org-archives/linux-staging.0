Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3643148D8
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321586; cv=none; b=UxsJ/NGzVwPHc3MIDLxyG4L+nkPjrG8zhavznKdpPj5sbfQCRR/U7Jdhb5yRa53ZCQP+nQxISfotFBzTaRBIN0mnBP+lJ3DwYkdcHfPcf0wMUZFKBS/IhVvf6gwy2oaEasSCe4b0miv617AxUx3hyvm8faYebK9E6AbwV5FfMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321586; c=relaxed/simple;
	bh=SMkplYX/bMvj4Z0t1+tI+g2pU4wIJJenSUPdT7OGtf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buJP5BVyKxwsbgjLrKbmPEhBZE0SOHtLsMjpRiqO3Hgv75yTKSXlnpBcx/GNXkhFM/hKEobeABxzqkc2Puaf9S4FHpTGQWhtHU3r0cf8dqD/Uib6ckTX6MkIdl3LYijXwZCth49lgTIw5I/7zLaq1LlNGPboqsmmnewjE/WsMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npFFSivM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npFFSivM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so502761f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321584; x=1792926384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGgqpUIm3hiiqmlP1271dLLo3XdVxiAKvps3B1o5QAM=;
        b=npFFSivM2gCRo5ZIs5AeaFHWBuVvSCSelhvagVBEXHY5hD7VG1CeGfYkSfuanb5084
         iiMtFfYC5QsSb6LEB1Cz9W5pskcaSxexzQC5/mXeo5U5lJxukhfIj3I1heVKBPd5VTDw
         xv8/lMxF5bazzPYDEbGjOp19TQJ7W651JuJ7UjA7b2Zdl2X4lT1VHt3p4jhg9VopYQQh
         4+o7yMkDWzS4Tc+7dra2EYHEUg0xDKGV1bMfbwWLYt62LxzW/yaQgWkkz3h9dUeaAOg0
         VLyIqmxOOafYZrUC/cMm516mRp6RCwpPKVfFmthfIVBgfKHLIPmEoO391gxdbHkFRDyy
         hdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321584; x=1792926384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGgqpUIm3hiiqmlP1271dLLo3XdVxiAKvps3B1o5QAM=;
        b=Gu6xxGr+pMi2lVtTwB5XQE70lsUdDqxQBmJ8Q3vfMNAbNcJzRgqNrhEA4+bhox7hyu
         IFK6O9hP9Bq5Wz7zFoOwWuHdXhyggae47xlpqi0Vs/YwgxxuI24+UwZOs2yO8t48IpKq
         O+I9Dt7L62Jrtr7MxrtCnprnap56LIKSS7UgHJVmYSx06YELEKlxGK9D2ewpg/KFf1Ld
         efPEgkf1HrV+M8oY+K5wZUqdEbvIveAd5+dIdNmIGUY4FrLAJXe0bgljNWdsstI0yyHI
         uhdoLan1xTTN623KA8Uic6CexXTJMjf/VwVUimOJscltsQRyHwCG30kuMsrj9eFPgxAn
         g90Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJapb9ZCahKq2qdSjXXbTBUAR2G5vYA8+g90LLftl7hJM9DIRsqmwpp///jnizAiBgd0FpnRsMOS6mB04m@lists.linux.dev
X-Gm-Message-State: AFq9FYK2MFeLgstUoTpZzLVM1YH9SFs0J0PdHtLD169FVXv7vXvkVxo4
	PRf3K7Xi58NJzc+zyivFH7VJfLRuzT7ThC2ITfd8/ntiEYpd3rA0AgwD
X-Gm-Gg: AYBFou1T/bFlTTqVGbXKpxwSM1dKiBtrnbH8XVQcPNtJGeb6cQZZcWRxkb5UcyBe/ik
	ywfKWfV4LI288ERFDMEhazQOX2kDERpfGSDhnXYc/Bh1dZkdlhuZQx2OYQ2nzM6hhHmfvhKnrKk
	U8P5SUGDSopj4PupngSw8srLoScH++k/+wVutExgvM2p0LwcfjljbyyT67DF9IQqYQCKUu7V0Gz
	gzhllBb3sfKQPHLz47OF7DxDIreotZXe/fbv+OKj1SuvfNC8PUD1/dQNRgiXXWrQObQyRkpWhrk
	AkNbOIpG0kTzIweHdxD3LAHtslEIs0oCOsnwY8PJV6ki/0K7U3vW4UTRTazW3U2QoqET90wXd1A
	P+cHU1CHK6zmW2Ijht9GR3C4JuZfnyME1teC/8v6vuBlWFFWo2DIRi0+WhSzN0pyhb3m7Ue30hl
	BHEqmyZflSKrgVXrIMd4u+zUgA4JRzsHAw/RzrasmemDA4y9cAReeH8/k3T2/K/2rUMJZS88A1n
	8xyGg==
X-Received: by 2002:a5d:64c9:0:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48e07976ac1mr10093265f8f.5.1792321583508;
        Sun, 18 Oct 2026 04:06:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm16578122f8f.47.2026.10.18.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:21 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:06:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove redundant dev_err() calls
Message-ID: <atSoKUqHquEhdTXa@stanley.mountain>
References: <20261018104223.164776-1-melihemik@noirlang.tr>
 <atSjRzJ3_ORJ_uh9@stanley.mountain>
 <179232125059.295089.11354359693726377618@noirlang.tr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179232125059.295089.11354359693726377618@noirlang.tr>

On Sun, Oct 18, 2026 at 02:00:50PM +0300, Melih Emik wrote:
> On Sun, Oct 18, 2026 at 01:45:27PM +0300, Dan Carpenter wrote:
> > Don't put this kind of meta commentary in the commit message.  It's
> > expected that people test their patches, so there is no need to say
> > it.  If there is something unexpected then put it below the ---
> > cut off line
> 
> Hi Dan,
> 
> Thank you very much for the helpful guidance and explanation! That makes
> complete sense, and I really appreciate you taking the time to point it out.
> 
> I have updated the patch to drop the meta commentary from the commit message
> and placed the test notes below the "---" cut-off line in v2.
> 
> Thanks again for your review and time!

Please don't send AI emails...  It's so depressing and cliche to hear,
"Yes, you are right!" from an AI.

regards,
dan carpenter

