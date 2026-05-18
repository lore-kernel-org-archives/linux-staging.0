Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55253C872E
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083715; cv=none; b=htx85RDa+cl0KxJHdkK30y2knY1ymR1Ok+oPh8M9+8Ouhm5UnZYOKhqAbLyxgDd5Gzy2bvrBHZBxrLLVpl/iIFKHgYbtDCVNDmdlEkoUiQWhdP8ZMzINk3WdXtAgyUzrF1LnF9H8trU74MegNGx8vGSuBMz/kGSPdAvE+WQZ864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083715; c=relaxed/simple;
	bh=TvK3iGfYfmbMlM24LYF/zVb/RnHEmKoM9rlhWqV041Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzDJfsHI8bsEuf4iCT3YXZKPyRuvZp/LGwbtA+H77RBdMD1NU0j07fMIcijdW7zPtk5y7pVbsThwWoce4yZV/9tmJpRoMRW+MjrHKrHW0E2606HRczNtDS7SxgPM0H2K9sC6FKrK1iEONmUSX9GLd51vJBk2gERI8FZ3vMFbPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKVIHSd9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKVIHSd9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe608cb92so959633f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083709; x=1779688509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Hz/KfdCdDHlhVkLy7DvI5Mr7z4Ds5X4EjB1uOw9Oo=;
        b=GKVIHSd95422QvLV5U3COntm2XioHelgj3h4bBfstzh7PF6u1XuMjiVX3G8c8Q7oUC
         VxOMoIYqZg+ATym+WwCqy85jdzDAUbzAG1kFo6Ot+2ojUaRLAgxnu25YPnbYFo89Nv99
         8c/L1BqLYyaOdjWBLyS4iLaqXJzK/BYL2apYW+xZ8P96YEtSvb5VKMVYrutbpVq+OHu+
         pXAqxe86cBoryhAzHqUPn8vZdK6ta55lJSLmS/9XAD2xDCYTxvQLO/eabmDKsZrXTDhN
         B3Bur2VlbUWN1/tQM8i85aOd7n5sekZDlPxcTL6aMg5FM0Pkbec2xvVb9NyK2HWEcMr+
         7BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083709; x=1779688509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Hz/KfdCdDHlhVkLy7DvI5Mr7z4Ds5X4EjB1uOw9Oo=;
        b=Y7zkOD2AkfLyGX0Mgdj6ZO9rVjv6vhqJBEorrhMNAh989PP24nQJLgjHQCmuKIHECu
         FOqnjulsiACT2crwxvDkK6M6pOq79UTx49a4gZgDlRuyDAXMyBEVtvUtfU5S43VwZj9Y
         CjsIbIKCa3x0oQKxkmzTJ2n0o1P6UACWmFjinRhNKldeNYjywsLVE3w7jaQAMDo/w0Gw
         OXuonvMDUDRXWdZUORJ8J/NPu8kKNEmFVX2aOffhhVqmd6sMCprCUGuTHEFAxsEUQNmC
         2g/aSHoPjsfpkY+xjHskzSu6uY32yEJi9LTpp1RuHbcV9GiT2pNe8BSx7ahPptkVi3qx
         Hlxw==
X-Forwarded-Encrypted: i=1; AFNElJ9zA8DcIIaOE2me1z8ERmxbeNNdEcrp6OSzky2cV4uXpzpbyRmaUkVwW0VdgXsytP1vKKyurub4K7DaX3f0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/nIjWVqPouUE9ArdxSWhohZEt5Yf3T0aHGcdxelq9Xlh07BEw
	A865Sswb/VYefOX8qpYL22rMoGgA+KWAWltYp0CPmMij65w7vxxh3R+AI6QgiQ==
X-Gm-Gg: Acq92OE6yBs+ahBYrjNJ2qUcyrf5muQvWh4xemYWk51pe+6LPWHBY2o1XbcGgspkMav
	LdCudkb1BwFjoLhHOLHK04ID9f++DNQJlo5fdvwaQDdZmW9KEjV+Ch4BZqe05qCC/FCVPD8dJBj
	pIZLOTReD6v35ptOpPpLjI6ZVq3kPlq7Bm72Wof2N/gVAtT2jwJe6YZlKnHeTt9XpLcPYfYbgRb
	KsNxzV5TJDcG8AzTFXHYiQbrpIYnCOYpRlHKzAvyQ4AnAx1JiVR4ZPDn4LBm85sndH28t/Ql5iO
	K2EKnlj1kMLlgQ2IsTfAai/ZMwn9pSdAYoACdzX3DTOO/cibeDgVo0hQoeujuY1o9JfDcAJ5XuG
	7ej0CYla33Wtjzvnlmaj6pP7ZvCr5ZNFq8u6cM6kEQYfJAiO16cMT5xejT/5K8h4d6iSsEo/NL+
	EkXepRKBEqpzsw7x3Ec8+vrmFmqddfJw==
X-Received: by 2002:a05:6000:2081:b0:452:6aa0:1d11 with SMTP id ffacd0b85a97d-45e5c59a132mr20885128f8f.19.1779083708670;
        Sun, 17 May 2026 22:55:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm35326304f8f.22.2026.05.17.22.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:55:08 -0700 (PDT)
Date: Mon, 18 May 2026 08:55:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: shayderrr <darknessshayder@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <agqpuWWTFYfnmW3Y@stanley.mountain>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
 <agqpefJAG-QMcM0_@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agqpefJAG-QMcM0_@stanley.mountain>

Oh flip.  This is octeon.  It's a MIPS thing.  No way you are
actually testing this.  I bet this is all AI.

regards,
dan carpenter

