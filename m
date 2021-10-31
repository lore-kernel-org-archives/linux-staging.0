Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD72C80
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 12:22:22 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEFrX-1mXYjU1zXx-00ADxg; Sun, 31 Oct 2021 13:08:33 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Mwesigwa Guma <mguma@redhat.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/2] dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schemas
Date: Sun, 31 Oct 2021 13:08:04 +0100
Message-Id: <1635682086-3200-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:eqjFY6C7Np2lLLbNby1RAONQKssAEFOeH6WmUp9aERNlBYhm+tD
 RZeL5GXZ2V9vCNSo9KV+zvQcdkP3uW6tGi6NEnzJx51cfHUc5Br0cyWl8U8VEbb0XmxLy88
 BEF9f+6y452DV6grbEwEDqzB93Qg4xoVB/MGtnEw7c3+EQj2Gtl20fEo0FMpJHMf5yiQcUl
 jmffULX94O5rIOxqWkXjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:33SO4Ti0OYo=:Fu1g5kG1I2NHRteYb6DWgX
 AdTS3aljp+L7guTbLd5l9FZjaLCWMplyHa6QMbBN66MgGIHWWDh6ZaESKTkHJMRKonvbJ+WRY
 YrIvLEZ+pT1xHTYEZp6lTGv23GF0shrjqXAY1dw2dDhNyy2lmpaeX+zvTdOpC9TGMiXQ+Z5wd
 VSPFXnpDAQXQomAdiyqbi5u0JlRKvOcxgs7Nu+hMUiD/Vw4YWLNnPHzch5zADCbMT18pywPJH
 Q/qkVV/8iHS+HidsfMb3GOTPywU0+nLyINrJxKEY6XwJ2YB+lfEEyGKBvL+kRKX4uCISwKPGq
 +wy5wm8FSQ5AYieZpl1ljZA2ZTT8Xwq5ogazrfeRhB3QPlTtlGSQ31YXsM/XhcTeG7hA7Vk49
 ZntZSACAWpBaE1TtDWr2eR2qt8d/Geg0TKz341IOwiQoUcsGhYI/a/hnmwMwuoKz3/kM+t7jZ
 /NPNEtDqK6PtNT9lays6l86cfvPqVQrCoPHoVxjgzlFxigcFh9Zed0ROVWVgVYt+CVym2YXCn
 idRvpQ0CFtfxpWMyRmZwujOhhR3BttRSxringRPPXnxj4meuEndrnXqxWB/+waJyvgi12XKN9
 pbEclW11EmkfzlZDg8/oGjVt9g8njgGKORwZBbXvnfxipH0ALyz/uNDBx2dSomGHS/42Q/qY5
 qnI/55Awrt+OLfaNa0aEWFguij4iil7IPyIYvcVNsjLwz/78bcUl3s3T7kxYmySrBoXoXIomA
 MLpKwEAJMWEni6D1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series converts the VCHIQ bindings to YAML format.

Changes in V2:
- drop some unnecessary points in the binding as suggested by Rob Herring

Stefan Wahren (2):
  ARM: dts: bcm283x: Drop fallback compatible for vchiq
  dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema

 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 45 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm2836-rpi.dtsi                 |  2 +-
 3 files changed, 46 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml

-- 
2.7.4

