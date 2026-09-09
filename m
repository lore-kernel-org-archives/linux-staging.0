Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0F563FB0
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965699; cv=none; b=teDSyePIzX8p/AOMSqXZElfegsatqvUT6vG/f5VJ/bjbQljXeuZ9z/yklSytc1/n8OQDTx0mvAAtuCWodJgcFCRPxY+BDwsEYv0T3jLLPLq/xmqVuv6jcSo3ZEhRBvE0DptjyJRvZNQ8l7667gUttRz1i0wu9PzMNkoKHquupxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965699; c=relaxed/simple;
	bh=3mrzF4PFQcJ4DbH3RGaSc+zm2PljjP5W+lnaM84CL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZS6QTPwUPzzmURA9kwtRIMU2tlKxzHKHAZsarYeCnRZ6QjCtgGWDaSm2AW/+kqXzhRaHYzKWPYKvf1U9WdQ88KpLtFWZYnR7lw+z7pEdML1ACb/8+eQrWtp/hqYs+jLu7H1xYmcSG7D0UGOfZZQG+bsRmqueA6IP/DOMQTtZ00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+0OL5eN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+0OL5eN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so8357925e9.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965696; x=1789570496; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=d+0OL5eN/3bqTyzo5DV0r0IbC+Ii5mRREWcXlbBtJsff45pBarXwd7gpU4Imh4vMus
         dzO1SOw/mDqbKd1VVDOqZQx2XB/x4EzFuTcTD6ZBhQjUN3AQd0PQ7Fpd9MwL10t2D03u
         Fo2H4/Rwx/D4eWg45zhM66U+P7jaDxCBwYeo3RJtYDKhxanvi+YNs+9JHL5iKxt9qkMI
         tUmqbZF2A8mqJTpnhVcqQ24C9JjNIC1E4w/UMsqx3YHhzIdnwczHfe3NEmcrqY6hx4Nf
         RKxZJyq/3tk7CJl3ZMUkA3xhBUx1vgCi90XmwGkdoLOzY6lLqeRHdu8zb8A8scBr6WH7
         84Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965696; x=1789570496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=UggHYOwDL45CVIBRw2sFUa+XrYE18OEr+WpyHHnrsc+bEaPiYEQNEIA1CPwEZQgwq1
         H9iXzfktSRZP6dygTJXopH9iZCKlvLZ9BFASeM0oidH/2FjXh75zLwXJz0FiP0mWEuTf
         APyGT0P924lY/HIk3cr98P0YtejN6oc2jumztoK/ORQpVa8GyJsqrBQQ34KqY92PXM+b
         4HoSv3xY516rTh3gXXkClzRa+gUGVLSWALidMkLqmLnXqzZDgNnO1AOVdYc6256BJdFC
         tJW5MvVul/Ne3xyswal5n8oZEv97zvezFeU8IrHnuVcLx2G2g21tK1P1xvSk3gy4O9A4
         vGfw==
X-Forwarded-Encrypted: i=1; AKwUvByDoedTFlfANJiLAvGtAQITj20Kb06WTNmNymHQABamrtaHxckAfCkGkreDTG+pIWDf3803oKaRvsgZhr0m@lists.linux.dev
X-Gm-Message-State: AFuF++kckaYfUIYNiS825soRR9XM7zuHQGNDgTWYNSMflSELtJdHrCdo
	ujSWKQ8tLfOYt88rd1YfW7pN4CgLo67snO32aM5E7WHqMIMqwyTPpM7x
X-Gm-Gg: AYBFou2bEKAKxcR55ZjAjKvIK/y2qZXFnhCGnuDkEDtXewLJlLH7MBwrd6zb3yOd6NX
	JQPbDMKmPyaR2aYw11q15z8ekLay05z/Yszs/XSMmD5zj8+41XPrc9UaYLWFdrP+xFA07x2E/ZO
	uesLrufqUa+77ygHCd+BPcQIcXoSNSZZIJgfS74YAX2c7W5t/T74M30rQRCvK8a4joJMacou23K
	IK3LyqLgWwZNtnUOh0+tgGa0gU+c0xiKaVXgQBBTysag4AkEOwa3arMS4DFoecpeCGR1OJNSIXM
	8fnPtXFVcLRnlPhxLZ4DmhhErTO4W+elytM5eaH4jNNHn1AQGuvrtOK3ZkiJKgTKMiF+z1DbF2i
	/Jk2i/+Bj1kT28vDqeBstNr1Ei1J+Q+guiFSDpRZhGAnRCJjA9U2UStK7Et200KskkfZW5zdp09
	8fcVb3IU4QzSkYW2/GnhR+MTyTmJCd0ClOTMVFFTMV2shyrMlVWGZ0H63hoE/pDS0tUaSLNTBSY
	S9FYB0=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr117005945e9.8.1788965695566;
        Wed, 09 Sep 2026 07:54:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm384918195e9.13.2026.09.09.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:54:54 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:54:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Breno Rodrigues Alves <breno3011alves@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5] Kconfig: fix typos in core makefiles and purge
 defective DVB debug (v5)
Message-ID: <aqFzOFa3ADXIBo3G@stanley.mountain>
References: <20260905003005.118245-1-breno3011alves@gmail.com>
 <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>

On Mon, Sep 07, 2026 at 08:59:28AM +0200, Thomas Zimmermann wrote:
> Please stop spamming this list with revisions.
> 

Generally, the rule is wait a day between resends.  Otherwise it
becomes pair programming and no one wants that.

regards,
dan carpenter

