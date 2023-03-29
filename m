Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2637881F
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=vTEx1qGiRwHQqbRWZ0F0YVEXYMez6RiJLOH+5aThdgE=;
	t=1680125241; x=1681334841; b=ELTl0NfYsSN/tWnW+coNPSzoyAJa4qrnNdcZv+EIJ4xjNRf
	LZHUygkFxFY+cJ+RUaMVwcIegn3lvbkiTxFSp9MTRDbSbtb+SjI4DdR1xw7L4fYvNc83oZ8Uuw/s5
	IOhp7Q0TfK9Jz7hasJRZeR6FzzBU3swl/HoKQQR6lY91w4eN/iCN4VvoPfhKY6sWa/DdH/Wz2PpIy
	UuMwzQXzkumKdbfT5AGEoWukhFOmS2HkbghZyB1sBYlYzjDMoluXyUBCFF/gSyOYhCxL5Jqk7xo0F
	O6snLB7EePzRucFZ89b1uFOSbx+KHGDm3Ax0POJUn+xzNwcPgffx0j58BizhHweQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1phdJz-000F4W-1q;
	Wed, 29 Mar 2023 23:27:07 +0200
Message-ID: <fbad112793615840745195e54eed98634233c415.camel@sipsolutions.net>
Subject: Re: [PATCH 3/5] net: rfkill-gpio: Add explicit include for of.h
From: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>,  Jonathan Cameron <jic23@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Jiri Slaby
 <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 29 Mar 2023 23:27:05 +0200
In-Reply-To: <20230329-acpi-header-cleanup-v1-3-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
	 <20230329-acpi-header-cleanup-v1-3-8dc5cd3c610e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2023-03-29 at 16:20 -0500, Rob Herring wrote:
> With linux/acpi.h no longer implicitly including of.h, add an explicit
> include of of.h to fix the following error:
>=20
> net/rfkill/rfkill-gpio.c:181:21: error: implicit declaration of function =
'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Sounds good!

Acked-by: Johannes Berg <johannes@sipsolutions.net>

I'm happy with Rafael taking the entire series, there's nothing here
that I expect to conflict, and anyway it'd be trivial.

Thanks,
johannes
