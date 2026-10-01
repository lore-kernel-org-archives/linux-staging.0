Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E662F851
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858821; cv=none; b=hZgy3ku8BY5fJxC254ZjqscE0AMExXmsCCM6zPgXcV48+yVRBVd7VWsOnnppDFaX2XnuojhsSSyTTW8zV4FVUnveAUDHFLoBz6YdEPrrXdaON6t2sN7jITY0OQ+Q0RJICqIUAE4d1b2ofzPrWxc7+Jg4UL6X0I2klV0ZrDcAxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858821; c=relaxed/simple;
	bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsTJjzgXiu+omI1IGJkDQ245dQTyrCgWRKZxPfhKuoHyJJfh9uI+S8OV8swE926/ycSmWTIyhcBBZwlqNu60PQfSq8GCYlGA/foy9xG0SEjRlPtvtk9ngu0QRwiF9R+MvbGS+HpuQJLSoJ3lVXWzSpphaKh/PoptyuoIEfcxXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQ2xc+mg; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ2xc+mg"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6aeeccb7d59so953569a12.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858817; x=1791463617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
        b=hQ2xc+mguDTC0N17+hWNB89TlyA+PX46eYQSeMrcVKqtUcs8MHBfq+9P5P/4hu33RI
         rKIyL9UuNyNHM8AB2sJ9q49usoxTNiBNyfSCvd603kbY/64SMstQx3Un0X5SajxHe+Pm
         JPqdRa8jrpr6PpS/5JtOehfZi+55L3nYntTjvoPtcB8TWrpxKJUFwjosQmQmtwdcyLz7
         vKqI7JQ9ckUPOQ+kuT25N3d24Tj3UiIGnDHBAJfwvwKkyfcbhkBUp9AF+F1D9NaNN6nA
         iccSVRxS/pnXIWpSRq+K7ERIUS+YDGZdOugjyDHFOM9sg3VOMRt/bX2nrovUMPoaXfFl
         CorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858817; x=1791463617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
        b=PvG15ES9LDBG9Ta4hkgcSc8m5soJlVfZ32gleSJoFypZPsD5R0+3h52Nf6tyIRI0la
         5qdfilQWx6T/0zTxMKDVatFVBf3/Bph6zvEhSITw+JEBnpUU8/Rhs2+vfmgnXGG1953y
         L3oiRHJkwsc7h75RYQJwBVZxhA/Qvuhl+ljPHPCS7klt/XqUYFioBdqcZkMMeGxXG3fZ
         tD8RMDmJlAWVVJ4g+t3qsTWTz+JchshqMLdWh3LlyYgTzpEg7MycM5CDRXPFVHuZ6JAd
         T2MVGrSfxg6gKK7F/+nZtgrDHspBXUIR+X6IGVt1LrKf9uY2ShrYvuduqL17PG+yX0M6
         PonA==
X-Forwarded-Encrypted: i=1; AKwUvByIxszQ7grqH/kJQuN+6tdSlQyIIH7YiQ7srIAGUkzyzvopQq+OH8qW8XLtP2+0WznoRJIs9pCGXEBEAkOc@lists.linux.dev
X-Gm-Message-State: AFq9FYLP07P3+dfb5QzonkQpe/Tf/7XqNaUSIFPe2NyoX0v3oVXkjXFZ
	ckN+0XHeLsXh9j5pTo2m9l2No+ppoLIJx8MCkc6Ii4RL7/Nmj4fnunjKZPusy/bgetdDmg==
X-Gm-Gg: AYBFou0J2RuUsglLGoRV5BXfQthAmNr9Tcb0cT98IQ4d/7w/FqioBFxEY+b2i/kRaRm
	hO//Ww85Fisf+S3jTCbKQhdBbF5Y+XEetJLESPRoWVWvv9lMw1j5EYPW9pNAnTW0tx9vbUwlj07
	mWdHtZQQwSAZ6FpjueYFox+cIpi+pPb6TjvGuf7mUR23TOsfKju6tQ91r/hDs0RmndGNbIamovu
	3HM39Ryp0dxBngKXQ1OZdxfieMb1+KQSHFxV+PpCZ5lvf/ZCjFCSLoG9weYNyT2oTf2+QbJBAkC
	Q4uTFaGSamq2x/ZP4KqFOx8cIFzvILR6F4BvBu3X+XZ4hl6nVyfOLotZ0NMpNTOPSR88uwvYn0J
	R+2n3QOIFQv/0J5AfGs9J88fgPBPN4DWvGiZVnDxVy9XVMz72vIk83Su3/tQHWCXKxxZxw640eP
	3roJZVmdnRVJoB7C7EGl6c0jBG/hI3NjxRwZSyE1VnqO/j/HGdpfnMvRxfit0lfmKm76s=
X-Received: by 2002:a05:6402:304b:b0:6ac:69e5:9f03 with SMTP id 4fb4d7f45d1cf-6ae1992f247mr3075245a12.28.1790858816459;
        Thu, 01 Oct 2026 05:46:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af7e4fd2dfsm713842a12.14.2026.10.01.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:55 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:46:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ronit Gupta <ronitgupta138@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add missing
 newlines to sysfs_emit() formats
Message-ID: <ar5WO7BtV7_ygg1e@stanley.mountain>
References: <CAO=9wt733yd9Z6nUbV7awHoQPuu-4eAHWnH10k-OMhRrW1bs3w@mail.gmail.com>
 <2026100118-banner-casing-56e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100118-banner-casing-56e0@gregkh>

The original patch never made it to lore, but check if someone already
sent this.

regards,
dan carpenter

