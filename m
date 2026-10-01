Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413A43D813C
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851182; cv=none; b=iYBKOnFKLCzP8FNRvliKxAs7DpOCSwAkteW1pssgGLc66TGebwqFUn7dsC3QmF3v1qKxYglpr14+NkHLK9OQ+MgVhTsTX8Vvwu5phgBw31q3RAr4r1Nl9LL3lyCiKpR+I5k2iD0iWxPUWG5o4ffeRnFgMbQQZBMkkye7b1RhGFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851182; c=relaxed/simple;
	bh=dpiL9TWBEfuyEktkWYv2DyjWYl7Yr/RiJd4Pv8HE/Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhStr6hrHyiF8ql3GtDQ42TpeiEeBcsJtmf33htmPWcQ50Jb0MoLIar2cH+sEVlRm+7sD6AvdGc/bXnCo4KVrEqJ1qqUpJGZv7ZrmuMMXr+auVVqnP2Vo2S2Rz0cSWeQqoZI2IhWF/Hce6gCFmYozeACrBADQ1POu8QvVaRrCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3YdqzXl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3YdqzXl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso33171165e9.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851173; x=1791455973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRYLe9rlb6ZBAh72YUbfVfETug0ycBYjwmS9i9Ee2qU=;
        b=J3YdqzXlfa6aDOSb7wKioY4hK26ExfzclKdRv8XNEk4ijIb2p7n1ooBGjKJKgQMPR5
         76RRbJW9PP47xup7dx926I3OHvpJIwqpInBCUeEAvGl5nLAYgUc+QTV/udpI9LoqP8Aj
         80feipKkLyLURbxXrivrS2CqMJRYN/Bn3NczZIKStG8QKMN8c0dUI7WowobjZtheo2hu
         T//6aQQq9FzC2fEfWunMCStUg6zqwzH0mh2hif2uJzMXF0Qt6J1z+AWUADihrBhk0WJ4
         DR0hc77CNH1TS7dOTz1hw3uAfw0kmb+qiU48jQnNErMa8zjwiqxD752AVMJ8Pzp/yr3o
         Zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851173; x=1791455973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRYLe9rlb6ZBAh72YUbfVfETug0ycBYjwmS9i9Ee2qU=;
        b=WYODJWp9OOQVwJNa7yrpO6MjnPqDgljX8YBSvAt0j1+IvUzNO6TcB+sgn7V9aAvZ5B
         6zheim5o4N6et6BEKtZoJ4lkZZraPbzZVghfDBL5aFhACbhCOgliB6conjdIZX7oqiO+
         27MUVwxFAhzjUy6w1kC4YTT75JxnuW4x50KTLtl32pU5mBgb4L8J4bk2vd8tiGeXAPF6
         LL1och3l/DuOV8OEyH5TBFEKDoQi/PO0RwrzI42/sTE0ofMBfJsn7/tixX+QPBrJ+/7L
         X77EIUasVgX4Yp+NmnUNJV0tQZQRSbcQR3LNghPKgMVZWYtt5f2lrrdZtezwykLsG33s
         Y+9g==
X-Forwarded-Encrypted: i=1; AKwUvBy+TQs/UmxEttUT6aJ5SlSNU4w7YhfV0tZp0oSgQ2j3zgT3ZEnCGxsDok1x74/swplcp7+qgOShtXAW4nWQ@lists.linux.dev
X-Gm-Message-State: AFuF++nwa1bP9ZMW00RRGGiDf/E9iQWSGOiJJ2B/xDuB5tyVf5cW5s/Z
	NcAL3AhlBuPCPbt1Cl2sGzbNM6GtcHGam90wX+LYBa3JnTXzcvr0UxYk
X-Gm-Gg: AYBFou1zEMHCCMvwXAYMTK5n5usXbgCmWToe/XIo5qkH4C7aq/ENSYHU8GCGbQksPaU
	QCQFhW7Rj3cr4cekpohjBfiHGtR7aa0EtZuFGcDbXYqH6Tj2oZU/MhEcpU0RutNMQ77BvtbVimq
	8UcdYf64skx+iOjKKtqs9AsN6u7dRtaV1BsB4BerTOuaa9ixMw9r4rH8Wek7BdVvhuXWftqqne3
	Q4S1YgA/8wlhyTMLHrg/TMSNN2aaRs8FCgfSnH/Jor5hm+Ce8hftf9uTCfI6mKB8Nonqc5RzBef
	JA2j0bGmMFXVrM5gCu8xR+ENWEpBq3YoqgbTgjPpy3zC0+cI1ENlNoZ/4R68yhgIVKuWkxAWxKC
	j494pZ9Z2oM3EM/a0hUkQLQuRMBzezuam3wgey3Dh8PC5bREDled+oCBWxK44j/9n+wcXrJopNH
	GAUK0LagVDClL2LXdl+qYGxwbNepZWcmfZ+g3HdhelWsDcUpW2N+WVTJtO1N0SiX7sDX0=
X-Received: by 2002:a05:600c:354e:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a01b11bb45mr68566555e9.18.1790851172834;
        Thu, 01 Oct 2026 03:39:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm42313625e9.2.2026.10.01.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:39:32 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:39:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: return bool from
 check_pending_xmitbuf
Message-ID: <ar44YIe8blCkSHCP@stanley.mountain>
References: <20261001100441.102765-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001100441.102765-1-matheus.aalmeida@inf.ufrgs.br>

On Thu, Oct 01, 2026 at 07:04:41AM -0300, Matheus Alves de Almeida wrote:
> @@ -2482,7 +2482,7 @@ signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
>  
>  int rtw_xmit_thread(void *context)
>  {
> -	s32 err;
> +	bool err;

err should never be bool in the kernel.  It should be int or ssize_t.
Same thing for ret ideally.  Pick a better name or people will think
"ret" is a normal "ret".

>  	struct adapter *padapter;
>  
>  	err = _SUCCESS;
        ^^^^^^^^^^^^^^

regards,
dan carpenter

