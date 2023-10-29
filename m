Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE0E7F9
	for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="d8JSTIYY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so3676395b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Oct 2023 08:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698591826; x=1699196626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H6ir4IyNIpgPfeg5PpaJZ9z59cp7XPXbuJPLYNgpBPo=;
        b=HKHntzu0lJA0UhrJLU0unsQE+LqAGlCNHTInJorq8qPna1fvJuO6bEDpP2sVCt9PCz
         s8SWHcrrcTjKCRizOfYHibnsOkogpmalOGMFL0t0Bdq8vIa3ZHmD3YcY62EYSbSQRDlG
         5SMXuLuREdkMTIu1Z3XKIA2w1kMH9rgRL/TmC8J0uYgHZZAbjPWupvH+icyqkwwi2M/E
         Pf90ThfsKIY3ZBGRaLHlOaf/smPfW4h3u9Le5HZGbzuJHymVBtiAuXq5D9KbJDIuZvQ5
         ajn0Q2byYdcnCvFhSNfEG6TfQq066C2xd/EM9hce15Vzn3t9Igf7GTXlSs0Q+kXpcQfO
         Ya8Q==
X-Gm-Message-State: AOJu0YxXAdlzNbDc01/G5VHc4EPN9blhYOl/ieUvBdd2U5ThfhdYmXXp
	nYCpzmWQ7XJsRYwhVRkOJ8w=
X-Google-Smtp-Source: AGHT+IFDGv0IcFGDWjhbcPI+vx3C74smMoDAYO56wRfA06ayqvXVbl2kvjWykZMLhiqfroLWBAg+tg==
X-Received: by 2002:a05:6a00:14d6:b0:6be:4e6e:2a85 with SMTP id w22-20020a056a0014d600b006be4e6e2a85mr11098491pfu.30.1698591825774;
        Sun, 29 Oct 2023 08:03:45 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id fn4-20020a056a002fc400b006b4ac8885b4sm4533150pfb.14.2023.10.29.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 08:03:45 -0700 (PDT)
Date: Sun, 29 Oct 2023 12:03:52 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1698591821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6ir4IyNIpgPfeg5PpaJZ9z59cp7XPXbuJPLYNgpBPo=;
	b=d8JSTIYYHV2EEGwnhsMk8oG18/GbaBfncaQMdV6VYK5kRB6LjtYzm7mrjWUNYya9BLcKTE
	T5uuvHapRMfm2KXhV5BmI0jMbHVEvpxv/V9zMn+dLkpD92JIE8rPJC+vAdCXR1aT8JUW2i
	U71pqxy853rQZl+6A7nyrJ+aALIshe9tigNdZLISaHfRGRqC+1DlTIoCfL0U7FeZ1V+W6L
	+PY1/oKNJDNUFKbcu7dSEd3S4e1NQejBvghql4RTIy6CW0gooOxZRx3ZvK+8gtkd9ONXOn
	KB8hd2Y5zi+wRzr2x0jkQOypF6a5vABDDDFGOkKUpkfnxa19fobkAl9Beu/lRw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Phil Elwell <phil@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V2 3/3] staging: vchiq_arm: move state dump to debugfs
Message-ID: <opisoilw6dz4ptneibeesv5gqwnuawybprvguj2v37wm62s4nq@wppomurt3zbz>
References: <20231029124837.119832-1-wahrenst@gmx.net>
 <20231029124837.119832-4-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029124837.119832-4-wahrenst@gmx.net>

Tested on both aarch64 and armv7l on a RPi 3B using the vchiq_test tool.

/sys/kernel/debug/vchiq/state
/sys/kernel/debug/vchiq/clients/**/trace
/sys/kernel/debug/vchiq/clients/**/use_count
contents are fine.

Tested-by: Ricardo B. Marliere <ricardo@marliere.net>
