Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5303630BB
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452766; cv=none; b=k4bUktTRFRiZ6ycDb06VyekflQRMZI2cmUFRy0mB7NaxNtP4YZV52pUvb7dekm+lxylkGUayjaRE2Ktg3IDivQeLq5l37zwpJMJQejkSOd4YsxlbZd8qNKqUyule5I+aKC8PtWdPrQktAzql4SSaXML+yZ0KHnwtuSIbpdkxgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452766; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GiiyI+L+g7ez58Zh2SlRy/QRkJpdGbKfVSDxySc9ziBiiP5KOctd2/SR/j5ELtzFTW9t1eaz/lQbYNQzKlx83x0/OHe5xVSMmWuQPu8F5+goa4kKJ20w2YPDFKM4sqW3wkBPe89/clsGwvroqds+68QiFEwd/B4c+xI4h2v+/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFzaH23v; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFzaH23v"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so6773363a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 03:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772452764; x=1773057564; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=hFzaH23vNkO7MPNHcMfJXbga98mR21KZHS9kKDX/XNwN5hDZ+CP+jJv89w8ApFcdhu
         tjjFv5JDKxv/cjOAf5Fl8R+uyVeu9XPat9AtUwVkt+ah9vbmLB/bXKvAUKuJcfijgXHN
         vYiGYzMMWyBbBtKBTGBAV6ur9U2QLI7hMZfsO27H1U1gqAAvQm3KxPQreWS1qkKUInHx
         cLArMPaTajUJwiSNfZP7I4+8fLd3QF1JlIPYOLXne2zzHVHt7rXSFIptGfeklIYBJQQD
         6bMpXk9vUl//B5I2c/qMcSyWw+oWnCTYFhl18K5mepK8yhFz9IvD2CDBb1kf0a1giMhM
         ou9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452764; x=1773057564;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=uA5r3yFdskrlhpfqkQmuWuZPOcCF2yH/NhJTy2CaRheU/6hlACSZfFC8VQeXjRbQiE
         YtmEbAn/Vri67SBUxscD02dwwKdE3FwyQ00UXMhqcJ2duSmxNT+XZ0ITWtLw3+Oxrc0z
         jIAVtazLBLUdYL5GpwvwHEfIxLzm612MEfkV0nZijTY2QpH2cqfwLO55x8clEs6GhAqz
         wmafYLJuQkeMl8w3B02satoQpoQugms/iGV4x2/XaNjilP1EqjJ7Y6Qt53ToyruQbaJE
         eK3MEMMgITUvtwrKYmU7Y1PtWk8UIlWT+H6q8ObjQQtzR/i5oVsHW0+dBM/k57Uajwfl
         AScA==
X-Gm-Message-State: AOJu0YzmL1g18QNyi3hcahLtZWhxucu+OYY9ydRHQ3VcOgc+8KDVSGiL
	f5DX+Gn6MOq87VMEzZcyMA9UKooipiaYo9zv7Bs9vpwRojog+eNU8DtufkpHYM/w
X-Gm-Gg: ATEYQzxZ+dC9TdwdiNmnrlHhu9cVpiEVCDzthtu88WcrggxYOpIcR4/1SD+y6woo/VT
	e+jgdqE24Vsb3Lh9uk/KMWTQH6j0mmioMrLW7pEn6aOC43y23bfwhOmgs1dgFzPy19V7qyJvTuz
	IJhd7FMFFQ3ZabFR5NkLdLv/bg2ehHJpKROLq2M3ekrVdN8aGl8nHFnffcJUue04ykcLXTGpMoG
	G/14a8F9ToTa0OpoBRi8itu+sHz+57jQejayeok2HixS7O5xi3NTaY75D0x/kiCu+jBlcXCn6KU
	B8BFgN0HIJILEzMcuX4ruBloY78apEkwIGbciGpR49q3LTnBTJNBXmUPIOKQ8PGDKEe8UxLBdKG
	j8u9CCwAISU9JkxQXd2Zj9/x4vtIP7Z/da4MRheIGiXkXAGn3ep/cL9PgsjVZU7kAWgpnl1nP5P
	zUTXxyaiMsiT+5BsvaumxTc08=
X-Received: by 2002:a05:6402:5192:b0:65c:734:ed34 with SMTP id 4fb4d7f45d1cf-65fdd6f12f6mr5963860a12.14.1772452763668;
        Mon, 02 Mar 2026 03:59:23 -0800 (PST)
Received: from localhost ([188.89.210.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36224sm3479191a12.7.2026.03.02.03.59.22
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:59:22 -0800 (PST)
Date: Mon, 2 Mar 2026 12:59:22 +0100
From: Pin Delay <circacircuit@gmail.com>
To: linux-staging@lists.linux.dev
Subject: subscribe
Message-ID: <aaV7muvYUVAbjGYv@luhu-G751JY>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

subscribe
