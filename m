Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3C3B2FC8
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155618; cv=none; b=tw+SmdwETVnaay9ZFniWDgAV0zIvcr92YLO6La6ovsyDEyB/rr4fDUrhDZ3CYiZ9JDvX7XQdwCFAdPvylZkXiAVUyxiWyenD/1RXu0wSREfdv5Li9L8TEPAvJLt8ZcR1aAPeh1fPhkoYD9vjUPcpzzMzSpd56yiIgHUqE1LtPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155618; c=relaxed/simple;
	bh=C49jX86SG9K6BmD+/opE0Dfz5qgrmmN59fTcyKGfSGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt3uz9PSusMruuMbmvZ4nvccvu8E9gSCUDJOXTCzCegMW++5gl+N4ybQIR9zXv8GCd1qPB3o3yUNqPbgwTDPbn5ALHos66l9biliKS9TivgYiV8+lo3mQDBHlkJE7RUz0xd60EUG/vI/Oy9H1e6nNRIE8+weBjk9lnNqIbNil/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy8jaEId; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy8jaEId"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso43586555e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776155615; x=1776760415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPqeF+QumIdaM2KY0FD8hMmbc/OHMmI3exKhMWomvts=;
        b=Gy8jaEIds2Qk3x+Wyl+bKSjLyb/ohLEy3yvMxBfnTEiptQPRTmRPzjRuqc8rEJuVNv
         QsR5nMu69gymOnW2/NBtP4jlSqsAQETQ4euWhrUfCvFevyM2XOCcEyDJNlkvuEmqDS2i
         R2Mn1p8Rw5CfaHMrM4hK7dtyjcv7PiDfzLSv4PMth4uiUl0+24NYqZO2kufiLwvRhAcN
         yn7x+IWHH8+znitf8/AKedjSk/fRYFSI6EeL97K4I6zZV9768mV+qJoTAFkBqA8Ba2KH
         do76uVic9csSg6g41fYSZiOLxvMnX0QLzBHImMBGnFf+ROIIdEJDj1cvisvqSxyatpZE
         Sglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155615; x=1776760415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPqeF+QumIdaM2KY0FD8hMmbc/OHMmI3exKhMWomvts=;
        b=OKn7W2VNyZOX6igxfJUl9IxYnEHmgAbbmrV0Oogv/TCiDZ23TcuIGdEVdEmfDWZ/iN
         OT86WxDzHoIGBYivSINOqF2YHlpPM+gUlusK/111Fllq/46M3OxYxTR3iNVSwk3Bqhjw
         Ev9hCAmC/e7NlCQ+kh9uRCK76pV2gFV4RuW82YdEeqT5OP8UlqOaYY0Q6hSgLuodwaM/
         W0/XXa6T6raf+8ZhP8+p4pJXAB01ngJKzhMtx51ycFyDf3WZ3BtMF40CAikeGK4GOjgg
         ninGZgRaKZlmFVKCkFIB2dnc3fBgucViq+oau9f15lirjtJM6HBPvD3yuBVFH2NnqvZe
         aRzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eTzDAid9WMKsj/4M8l5PEBvpKUMx1N/QVsuIGl+vAy88VF/B76bX791vclQYxR76MheGIgeivDBkAff6y@lists.linux.dev
X-Gm-Message-State: AOJu0YxKfUblNcWAXitHhdYOcjIByYgbmy6x5sNkDA0odcIZTq8HSpi2
	JjZYigeoMJvshCn3C/FwgGmZ+Id0kcnIrR1bO6ZnYyna6n3dz9iDaVct
X-Gm-Gg: AeBDieuPauwpfsVdLAoRgrXS2LnwGisbDwAQO07b4FMppv2SRJ0XcuLkL2MiNNZIWPQ
	/eCj/vaw1dsesEOG6CAtlzM1MSpO/e4PkXGjAVyctGYgJqIyhJBTc8IbgRzjdVa8loXhqkpgHQ1
	TLNaBEGg70HZQxZdDJh0ohhk1Ws0NGXkiu/7Ka+qcGwGcAoLJXDjSQI6MV+cOLh907hbj3cHIBg
	tXdxpQP3na/iOTu3Zmcidql7SQx6n1xgoU6hiyliyIPdPLgawdnk0FDvEUkf9vPNiKY0ebxGHTt
	XjC27+sISeXItrQS3f7c3PNotclC1rIe2lhOK+kmK5ywKF5E/saBJEbk2vLs830mTLBbA2JO5ZB
	oRjtqXEMYJCbn7OLxbL/gWalBjKUcFjIAHAKJDLIP6qwoB8GOK3T0XWS0IQyT5RUzBC2wx2Y3zq
	UyHM81IX84u8LempscHS06Z46X4sTCnV//bAcU
X-Received: by 2002:a05:600c:3546:b0:488:a82f:bbb0 with SMTP id 5b1f17b1804b1-488d6889a3fmr225954765e9.27.1776155615374;
        Tue, 14 Apr 2026 01:33:35 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm57760055e9.6.2026.04.14.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:33:34 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:30:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unused struct
 rtw_regulatory
Message-ID: <ad37DlKDaAcKhoxd@stanley.mountain>
References: <20260414081325.142313-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414081325.142313-1-deep@crimson.net.eu.org>

On Tue, Apr 14, 2026 at 10:13:25AM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> The struct rtw_regulatory is never used in the rtl8723bs driver.
> Functions taking it as a parameter are always passed NULL and
> perform no logic with it. Remove the dead code and the struct.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

