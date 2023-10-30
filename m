Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFE4C7F
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qxMYU-003I9D-Ug; Mon, 30 Oct 2023 08:19:22 +0100
Received: from p5dc55299.dip0.t-ipconnect.de ([93.197.82.153] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qxMYU-003Lqt-Lh; Mon, 30 Oct 2023 08:19:22 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1qxMYU-000ydU-0h;
	Mon, 30 Oct 2023 08:19:22 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: arnd@kernel.org
Cc: Larry.Finger@lwfinger.net,
	alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	claudiu.beznea@tuxon.dev,
	davem@davemloft.net,
	geert@linux-m68k.org,
	geoff@infradead.org,
	gregkh@linuxfoundation.org,
	gregory.greenman@intel.com,
	johannes@sipsolutions.net,
	kuba@kernel.org,
	kvalo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	nicolas.ferre@microchip.com,
	pavel@ucw.cz,
	quic_jjohnson@quicinc.com,
	stf_xl@wp.pl
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
Date: Mon, 30 Oct 2023 08:19:22 +0100
Message-Id: <20231030071922.233080-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023131953.2876682-1-arnd@kernel.org>
References: <20231023131953.2876682-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.82.153
X-ZEDAT-Hint: PO

Hi Arnd!

There is some non-x86 hardware like the Amiga that still uses PCMCIA-style networking
cards on machines like the A600 and A1200. So, unless these drivers are actually causing
problems, I would rather not see them go yet.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
