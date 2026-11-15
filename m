Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755465;
	b=qtdM7KOmPFFL0kOwjgq1EQgYdkDV1STU6W/pwJ5mIjL9Qh3QsllzNrMFhillrUjR8Ww+
	 TC3890ZOd0yBgTnq1pwF/E3l8Dcb+2l6+exKRs960ZiShEJa2SDvKoL1oXr8/Q0RQpRXF
	 hxyeBN/B7K4eGjM8ZksMsRR2MC2OXunzVk++CyrgUIKUDjyKV6BRG7PVDfCERfx9lQehv
	 UtKEca0PYn+T58YCKsfObW0WEy8I16B8iFlLVfUNxbpwARSuDAE0GxrkCz5ZvEbRywxw3
	 ajMvixyilxj+/CoKYnsxwkMMq1rI32ZE8kh2Ala4Ss/TRRwBLv93NSithq1dMhLtPOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755465;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=81OcdDBetZWDBVhQVwfh27MNyaK4SMRxfOTd5O1YPCU=;
	b=kv2MxLXTrWUdx62Oc/6tldrkntxRqgk3b7LR6TqIILsMm70x7K647p/dbm15ybWtIsfp
	 thLx8XlIQpGhEtOg9SD01iO7BIjB0h7ERdXkfLZZf4vgsMYRogxMPMglQWYfPnIC5h4Kr
	 zFj+3yKt/f498MNEoZZjyDsz6Xip43KM9SZX0OsjVx4b04CoE/yINSOiy5sDWzRVRq1b1
	 oUNGo+r3DBkKEYsYcaHaHj1F8csoN4RW2q1/OKc4qD5D9WTg9MvVVaBcMzC6f6b66zKDT
	 NZUcQESAVXaojErvCFt+XQ1C4PNfGUXCuF/x/Z1a38gtBdTUiRLyn7VlQQXeXEkSWlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=qsr7tx6rzvcwjomm5khlxhpudm.protonmail2 header.b=uG8rVRq0;
	arc=none smtp.remote-ip=109.224.244.26
Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F8606A31D
	for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 15:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679F8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=qsr7tx6rzvcwjomm5khlxhpudm.protonmail2 header.b=uG8rVRq0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qsr7tx6rzvcwjomm5khlxhpudm.protonmail2; t=1794755458;
	x=1795014658; bh=81OcdDBetZWDBVhQVwfh27MNyaK4SMRxfOTd5O1YPCU=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=uG8rVRq04pkrPfMQQ0hlhz/8CMzYl4/kL4S+D8DcMjfVa4WTZIQ51Gb/zVqMZDkHr
	 0Dr7lbkeFB2wN/rjP36qi5eFt7gyZzV9CjQMUxZUwWwDMQVizeTMNxTEH3dZDXVcvh
	 QusqUnbMHE7LdZAux+uA1tXtybOlQlQ/PrmenRAQIukce1Bcp2SJDl4dWzGndN4nYm
	 w5OGeqI7BO6ilHX9zTfRQSHEO+H0FC9hweO0tet+t+cun0rfkKtZCRS1ZQt5OKSkb4
	 vGE6PHvO1+TNswyj4skGM3tisJNZsEurxBlFx+5Z8RKqsi5BLms11HmpKoX66lvMVw
	 8yrTJKISbTe3A==
Date: Sun, 15 Nov 2026 15:10:53 +0000
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
From: Federico Franceschi <federico.franceschi@proton.me>
Subject: r8723bs: NULL pointer dereference in GetDeltaSwingTable_8723B (RTW_CMD_THREAD) on kernel-7.3.3-300.fc45; 7.2.15-300.fc45 works
Message-ID: <6f2IDzSi9tnsIOQ0MsZOYnwzRrvPFFF_SfiGiOHNKDS0PVRE_gipGPRetY13dtnuF-hQ3otcwgURI9iLKFV-XVP9r-yqvcrdDx7qIU9hM7Y=@proton.me>
Feedback-ID: 223168557:user:proton
X-Pm-Message-ID: 05b2358cf9e795e24202cb132d964ea3b144d615
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hardware: Lenovo MIIX 310-10ICR (80SG/Cavalli), BIOS 1HCN42WW 04/05/2017Wi-=
Fi: RTL8723BS on SDIO (mmc), driver r8723bs (staging)

kernel-7.3.3-300.fc45.x86_64: oops in every boot I checked (3+ boots),
about 4 s after rtlwifi/rtl8723bs_nic.bin is requested. Afterwards
wlan0 exists but sees no networks; RTW_CMD_THREAD is not in the
process list.

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
Oops: 0000 [#1] SMP PTI
CPU: 1 PID: 876 Comm: RTW_CMD_THREAD Tainted: G C 7.3.3-300.fc45
RIP: 0010:GetDeltaSwingTable_8723B+0x28/0xc0 [r8723bs]
Call chain: ODM_TXPowerTrackingCallback_ThermalMeter+0xb7 ->
ODM_DMWatchdog+0x17c -> rtl8723b_HalDmWatchDog+0xf6 ->
rtw_drvextra_cmd_hdl+0x208 -> rtw_cmd_thread+0x27a

kernel-7.2.15-300.fc45.x86_64 (same machine and userspace): Wi-Fi
connected in 4 consecutive reboots, no Oops
(journalctl -k -b | grep -c Oops =3D 0).

Note (my reading, unverified): the Code: bytes look like a load
through a pointer at [rdi+0x100] followed by a 16-bit read,
consistent with "u16 rate =3D *(pDM_Odm->pForcedDataRate)" being NULL.

Full journalctl -k output of a 7.3.3 boot attached below:

Nov 15 15:21:48 fedora kernel: Linux version 7.3.3-300.fc45.x86_64 (mockbui=
ld@3e5a05bbfa064508b19e3589613d8ca7) (gcc (GCC) 16.2.1 20261029 (Red Hat 16=
.2.1-3), GNU ld version 2.47.20260726) #1 SMP PREEMPT_DYNAMIC Fri Nov =
=C2=A06 20:37:28 UTC 2026Nov 15 15:21:48 fedora kernel: Command line: BOOT_=
IMAGE=3D(hd0,gpt2)/vmlinuz-7.3.3-300.fc45.x86_64 root=3DUUID=3D7b058820-b88=
5-4f5a-9c19-e76481acd1b7 ro rootflags=3Dsubvol=3Droot rhgb quiet
Nov 15 15:21:48 fedora kernel: BIOS-provided physical RAM map:
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000000000000-0x0000000=
00008efff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000000008f000-0x0000000=
00008ffff] =C2=A0ACPI NVS
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000000090000-0x0000000=
00009ffff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000000a0000-0x0000000=
0000fffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000=
01effffff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000001f000000-0x0000000=
0201fffff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000020200000-0x0000000=
07373efff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007373f000-0x0000000=
073740fff] =C2=A0ACPI data
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000073741000-0x0000000=
07772ffff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000077730000-0x0000000=
07a25bfff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007a25c000-0x0000000=
07a35bfff] =C2=A0ACPI NVS
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007a35c000-0x0000000=
07a39bfff] =C2=A0ACPI data
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007a39c000-0x0000000=
07a445fff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007a446000-0x0000000=
07ad45fff] =C2=A0ACPI NVS
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x000000007ad46000-0x0000000=
07bffffff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x000000007c000000-0x0000000=
0dfffffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000e0000000-0x0000000=
0e3ffffff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000e4000000-0x0000000=
0fe9fffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fea00000-0x0000000=
0feafffff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000feb00000-0x0000000=
0febfffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fec00000-0x0000000=
0fec00fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fec01000-0x0000000=
0fed00fff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed01000-0x0000000=
0fed01fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fed02000-0x0000000=
0fed02fff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed03000-0x0000000=
0fed03fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fed04000-0x0000000=
0fed05fff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed06000-0x0000000=
0fed06fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fed07000-0x0000000=
0fed07fff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed08000-0x0000000=
0fed09fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fed0a000-0x0000000=
0fed1bfff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed1c000-0x0000000=
0fed1cfff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fed1d000-0x0000000=
0fed7ffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fed80000-0x0000000=
0fedbffff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fedc0000-0x0000000=
0fedfffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fee00000-0x0000000=
0fee00fff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [gap 0x00000000fee01000-0x0000000=
0fff5ffff]
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x00000000fff60000-0x0000000=
0ffffffff] =C2=A0device reserved
Nov 15 15:21:48 fedora kernel: BIOS-e820: [mem 0x0000000100000000-0x0000000=
17fffffff] =C2=A0System RAM
Nov 15 15:21:48 fedora kernel: NX (Execute Disable) protection: active
Nov 15 15:21:48 fedora kernel: APIC: Static calls initialized
Nov 15 15:21:48 fedora kernel: efi: EFI v2.4 by INSYDE Corp.
Nov 15 15:21:48 fedora kernel: efi: ACPI 2.0=3D0x7a39b014 SMBIOS=3D0x777fd0=
00 SMBIOS 3.0=3D0x777fb000 ESRT=3D0x777fe918 MOKvar=3D0x777ca000 RNG=3D0x7a=
35ff98 TPMEventLog=3D0x7a35c018
Nov 15 15:21:48 fedora kernel: random: crng init done
Nov 15 15:21:48 fedora kernel: TPM Final Events table not present
Nov 15 15:21:48 fedora kernel: efi: Remove mem45: MMIO range=3D[0xfea00000-=
0xfeafffff] (1MB) from e820 map
Nov 15 15:21:48 fedora kernel: e820: remove [mem 0xfea00000-0xfeafffff] dev=
ice reserved
Nov 15 15:21:48 fedora kernel: efi: Not removing mem46: MMIO range=3D[0xfec=
00000-0xfec00fff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Not removing mem47: MMIO range=3D[0xfed=
01000-0xfed01fff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Not removing mem48: MMIO range=3D[0xfed=
03000-0xfed03fff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Not removing mem49: MMIO range=3D[0xfed=
06000-0xfed06fff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Not removing mem50: MMIO range=3D[0xfed=
08000-0xfed09fff] (8KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Not removing mem51: MMIO range=3D[0xfed=
1c000-0xfed1cfff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Remove mem52: MMIO range=3D[0xfed80000-=
0xfedbffff] (0MB) from e820 map
Nov 15 15:21:48 fedora kernel: e820: remove [mem 0xfed80000-0xfedbffff] dev=
ice reserved
Nov 15 15:21:48 fedora kernel: efi: Not removing mem53: MMIO range=3D[0xfee=
00000-0xfee00fff] (4KB) from e820 map
Nov 15 15:21:48 fedora kernel: efi: Remove mem54: MMIO range=3D[0xfff60000-=
0xffffffff] (0MB) from e820 map
Nov 15 15:21:48 fedora kernel: e820: remove [mem 0xfff60000-0xffffffff] dev=
ice reserved
Nov 15 15:21:48 fedora kernel: secureboot: Secure boot disabled
Nov 15 15:21:48 fedora kernel: DMI: SMBIOS 3.0.0 present.
Nov 15 15:21:48 fedora kernel: DMI: LENOVO 80SG/Cavalli, BIOS 1HCN42WW 04/0=
5/2017
Nov 15 15:21:48 fedora kernel: DMI: Memory slots populated: 1/1
Nov 15 15:21:48 fedora kernel: tsc: Detected 1440.000 MHz processor
Nov 15 15:21:48 fedora kernel: e820: update [mem 0x00000000-0x00000fff] Sys=
tem RAM =3D=3D> device reserved
Nov 15 15:21:48 fedora kernel: e820: remove [mem 0x000a0000-0x000fffff] Sys=
tem RAM
Nov 15 15:21:48 fedora kernel: last_pfn =3D 0x180000 max_arch_pfn =3D 0x400=
000000
Nov 15 15:21:48 fedora kernel: MTRR map: 6 entries (2 fixed + 4 variable; m=
ax 18), built from 8 variable MTRRs
Nov 15 15:21:48 fedora kernel: x86/PAT: Configuration [0-7]: WB =C2=A0WC =
=C2=A0UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT =C2=A0
Nov 15 15:21:48 fedora kernel: last_pfn =3D 0x7c000 max_arch_pfn =3D 0x4000=
00000
Nov 15 15:21:48 fedora kernel: esrt: Reserving ESRT space from 0x0000000077=
7fe918 to 0x00000000777fe950.
Nov 15 15:21:48 fedora kernel: secureboot: Secure boot disabled
Nov 15 15:21:48 fedora kernel: RAMDISK: [mem 0x66b83000-0x6a896fff]
Nov 15 15:21:48 fedora kernel: ACPI: Early table checksum verification disa=
bled
Nov 15 15:21:48 fedora kernel: ACPI: RSDP 0x000000007A39B014 000024 (v02 LE=
NOVO)
Nov 15 15:21:48 fedora kernel: ACPI: XSDT 0x000000007A361188 0000D4 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A =C2=A0 =C2=A0 =C2=A001000013)
Nov 15 15:21:48 fedora kernel: ACPI: FACP 0x000000007A395000 00010C (v05 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: DSDT 0x000000007A370000 01FF43 (v02 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: FACS 0x000000007A2EE000 000040
Nov 15 15:21:48 fedora kernel: ACPI: UEFI 0x000000007A39A000 000236 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: TCPA 0x000000007A399000 000032 (v02 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: MSDM 0x000000007A398000 000055 (v03 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: UEFI 0x000000007A397000 000042 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: HPET 0x000000007A394000 000038 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: LPIT 0x000000007A393000 000104 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: APIC 0x000000007A392000 00006C (v03 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: MCFG 0x000000007A391000 00003C (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: PRAM 0x000000007A390000 000030 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A36F000 000645 (v01 IN=
SYDE CpuDptf =C2=A000000003 ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A36A000 00408A (v01 IN=
SYDE DptfTab =C2=A000000003 ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A369000 000058 (v01 IN=
SYDE LowPwrM =C2=A000000003 ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A368000 000269 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A367000 000763 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A366000 00028D (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A365000 00017A (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0x000000007A364000 000432 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: TPM2 0x000000007A363000 000034 (v03 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: CSRT 0x000000007A396000 00014C (v00 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: FPDT 0x000000007A362000 000044 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: BGRT 0x000000007A360000 000038 (v01 LE=
NOVO CB-01 =C2=A0 =C2=A00000002A ACPI 00040000)
Nov 15 15:21:48 fedora kernel: ACPI: Reserving FACP table memory at [mem 0x=
7a395000-0x7a39510b]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving DSDT table memory at [mem 0x=
7a370000-0x7a38ff42]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving FACS table memory at [mem 0x=
7a2ee000-0x7a2ee03f]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving UEFI table memory at [mem 0x=
7a39a000-0x7a39a235]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving TCPA table memory at [mem 0x=
7a399000-0x7a399031]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving MSDM table memory at [mem 0x=
7a398000-0x7a398054]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving UEFI table memory at [mem 0x=
7a397000-0x7a397041]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving HPET table memory at [mem 0x=
7a394000-0x7a394037]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving LPIT table memory at [mem 0x=
7a393000-0x7a393103]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving APIC table memory at [mem 0x=
7a392000-0x7a39206b]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving MCFG table memory at [mem 0x=
7a391000-0x7a39103b]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving PRAM table memory at [mem 0x=
7a390000-0x7a39002f]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a36f000-0x7a36f644]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a36a000-0x7a36e089]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a369000-0x7a369057]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a368000-0x7a368268]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a367000-0x7a367762]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a366000-0x7a36628c]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a365000-0x7a365179]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving SSDT table memory at [mem 0x=
7a364000-0x7a364431]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving TPM2 table memory at [mem 0x=
7a363000-0x7a363033]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving CSRT table memory at [mem 0x=
7a396000-0x7a39614b]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving FPDT table memory at [mem 0x=
7a362000-0x7a362043]
Nov 15 15:21:48 fedora kernel: ACPI: Reserving BGRT table memory at [mem 0x=
7a360000-0x7a360037]
Nov 15 15:21:48 fedora kernel: No NUMA configuration found
Nov 15 15:21:48 fedora kernel: Faking a node at [mem 0x0000000000000000-0x0=
00000017fffffff]
Nov 15 15:21:48 fedora kernel: NODE_DATA(0) allocated [mem 0x17ffd3f80-0x17=
fffefff]
Nov 15 15:21:48 fedora kernel: Reserving Intel graphics memory at [mem 0x7c=
c00000-0x7ebfffff]
Nov 15 15:21:48 fedora kernel: ACPI: PM-Timer IO Port: 0x408
Nov 15 15:21:48 fedora kernel: IOAPIC[0]: apic_id 1, version 32, address 0x=
fec00000, GSI 0-114
Nov 15 15:21:48 fedora kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_ir=
q 2 dfl dfl)
Nov 15 15:21:48 fedora kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_ir=
q 9 high level)
Nov 15 15:21:48 fedora kernel: ACPI: Using ACPI (MADT) for SMP configuratio=
n information
Nov 15 15:21:48 fedora kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
Nov 15 15:21:48 fedora kernel: e820: update [mem 0x75323000-0x75351fff] Sys=
tem RAM =3D=3D> device reserved
Nov 15 15:21:48 fedora kernel: TSC deadline timer available
Nov 15 15:21:48 fedora kernel: CPU topo: Max. logical packages: =C2=A0 1
Nov 15 15:21:48 fedora kernel: CPU topo: Max. logical nodes: =C2=A0 =C2=
=A0 =C2=A01
Nov 15 15:21:48 fedora kernel: CPU topo: Num. nodes per package: =C2=A01
Nov 15 15:21:48 fedora kernel: CPU topo: Max. logical dies: =C2=A0 =C2=
=A0 =C2=A0 1
Nov 15 15:21:48 fedora kernel: CPU topo: Max. dies per package: =C2=A0 1
Nov 15 15:21:48 fedora kernel: CPU topo: Max. threads per core: =C2=A0 1
Nov 15 15:21:48 fedora kernel: CPU topo: Num. cores per package: =C2=A0 =
=C2=A0 4
Nov 15 15:21:48 fedora kernel: CPU topo: Num. threads per package: =C2=
=A0 4
Nov 15 15:21:48 fedora kernel: CPU topo: Allowing 4 present CPUs plus 0 hot=
plug CPUs
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x00000000-0x00000fff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x0008f000-0x0008ffff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x000a0000-0x000fffff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x1f000000-0x201fffff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x7373f000-0x73740fff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x75323000-0x75351fff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x77730000-0x7a39bfff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x7a446000-0x7ad45fff]
Nov 15 15:21:48 fedora kernel: PM: hibernation: Registered nosave memory: [=
mem 0x7c000000-0xffffffff]
Nov 15 15:21:48 fedora kernel: [gap 0x7ec00000-0xdfffffff] available for PC=
I devices
Nov 15 15:21:48 fedora kernel: Booting paravirtualized kernel on bare hardw=
are
Nov 15 15:21:48 fedora kernel: clocksource: refined-jiffies: mask: 0xffffff=
ff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
Nov 15 15:21:48 fedora kernel: Zone ranges:
Nov 15 15:21:48 fedora kernel: =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x000000=
0000001000-0x0000000000ffffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x00000000010=
00000-0x00000000ffffffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 Normal =C2=A0 [mem 0x0000000100000000=
-0x000000017fffffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 Device =C2=A0 empty
Nov 15 15:21:48 fedora kernel: Movable zone start for each node
Nov 15 15:21:48 fedora kernel: Early memory node ranges
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000000000100=
0-0x000000000008efff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000000009000=
0-0x000000000009ffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000000010000=
0-0x000000001effffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000002020000=
0-0x000000007373efff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000007374100=
0-0x000000007772ffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000007a39c00=
0-0x000000007a445fff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000007ad4600=
0-0x000000007bffffff]
Nov 15 15:21:48 fedora kernel: =C2=A0 node =C2=A0 0: [mem 0x000000010000000=
0-0x000000017fffffff]
Nov 15 15:21:48 fedora kernel: Initmem setup node 0 [mem 0x0000000000001000=
-0x000000017fffffff]
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA: 1 pages in unavailable =
ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA: 1 pages in unavailable =
ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA: 96 pages in unavailable=
 ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA32: 4608 pages in unavail=
able ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA32: 2 pages in unavailabl=
e ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA32: 11372 pages in unavai=
lable ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone DMA32: 2304 pages in unavail=
able ranges
Nov 15 15:21:48 fedora kernel: On node 0, zone Normal: 16384 pages in unava=
ilable ranges
Nov 15 15:21:48 fedora kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4=
 nr_cpu_ids:4 nr_node_ids:1
Nov 15 15:21:48 fedora kernel: percpu: Embedded 85 pages/cpu s225280 r8192 =
d114688 u524288
Nov 15 15:21:48 fedora kernel: pcpu-alloc: s225280 r8192 d114688 u524288 al=
loc=3D1*2097152
Nov 15 15:21:48 fedora kernel: pcpu-alloc: [0] 0 1 2 3
Nov 15 15:21:48 fedora kernel: Kernel command line: BOOT_IMAGE=3D(hd0,gpt2)=
/vmlinuz-7.3.3-300.fc45.x86_64 root=3DUUID=3D7b058820-b885-4f5a-9c19-e76481=
acd1b7 ro rootflags=3Dsubvol=3Droot rhgb quiet
Nov 15 15:21:48 fedora kernel: Unknown kernel command line parameters "rhgb=
", will be passed to user space.
Nov 15 15:21:48 fedora kernel: printk: log buffer data + meta data: 262144 =
+ 1114112 =3D 1376256 bytes
Nov 15 15:21:48 fedora kernel: Dentry cache hash table entries: 524288 (ord=
er: 10, 4194304 bytes, linear)
Nov 15 15:21:48 fedora kernel: Inode-cache hash table entries: 262144 (orde=
r: 9, 2097152 bytes, linear)
Nov 15 15:21:48 fedora kernel: software IO TLB: area num 4.
Nov 15 15:21:48 fedora kernel: Fallback order for Node 0: 0
Nov 15 15:21:48 fedora kernel: Built 1 zonelists, mobility grouping on. =
=C2=A0Total pages: 1013808
Nov 15 15:21:48 fedora kernel: Policy zone: Normal
Nov 15 15:21:48 fedora kernel: mem auto-init: stack:all(zero), heap alloc:o=
n, heap free:off
Nov 15 15:21:48 fedora kernel: SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D4, Nodes=3D1
Nov 15 15:21:48 fedora kernel: Kernel/User page tables isolation: enabled
Nov 15 15:21:48 fedora kernel: ftrace: allocating 65243 entries in 256 page=
s
Nov 15 15:21:48 fedora kernel: ftrace: allocated 256 pages with 1 groups
Nov 15 15:21:48 fedora kernel: Dynamic Preempt: lazy
Nov 15 15:21:48 fedora kernel: rcu: Preemptible hierarchical RCU implementa=
tion.
Nov 15 15:21:48 fedora kernel: rcu: =C2=A0 =C2=A0 =C2=A0 =C2=A0 RCU event t=
racing is enabled.
Nov 15 15:21:48 fedora kernel: rcu: =C2=A0 =C2=A0 =C2=A0 =C2=A0 RCU restric=
ting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=3D4.
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Trampoline varia=
nt of Tasks RCU enabled.
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Rude variant of =
Tasks RCU enabled.
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Tracing variant =
of Tasks RCU enabled.
Nov 15 15:21:48 fedora kernel: rcu: RCU calculated value of scheduler-enlis=
tment delay is 100 jiffies.
Nov 15 15:21:48 fedora kernel: rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D4
Nov 15 15:21:48 fedora kernel: RCU Tasks: Setting shift to 2 and lim to 1 r=
cu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D4.
Nov 15 15:21:48 fedora kernel: RCU Tasks Rude: Setting shift to 2 and lim t=
o 1 rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D4.
Nov 15 15:21:48 fedora kernel: NR_IRQS: 524544, nr_irqs: 1024, preallocated=
 irqs: 16
Nov 15 15:21:48 fedora kernel: rcu: srcu_init: Setting srcu_struct sizes ba=
sed on contention.
Nov 15 15:21:48 fedora kernel: clocksource: jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
Nov 15 15:21:48 fedora kernel: kfence: initialized - using 2097152 bytes fo=
r 255 objects at 0x(____ptrval____)-0x(____ptrval____)
Nov 15 15:21:48 fedora kernel: Console: colour dummy device 80x25
Nov 15 15:21:48 fedora kernel: printk: legacy console [tty0] enabled
Nov 15 15:21:48 fedora kernel: ACPI: Core revision 20260408
Nov 15 15:21:48 fedora kernel: hpet: HPET dysfunctional in PC10. Force disa=
bled.
Nov 15 15:21:48 fedora kernel: APIC: Switch to symmetric I/O mode setup
Nov 15 15:21:48 fedora kernel: clocksource: tsc-early: mask: 0xffffffffffff=
ffff max_cycles: 0x14c1baf3789, max_idle_ns: 440795266465 ns
Nov 15 15:21:48 fedora kernel: Calibrating delay loop (skipped), value calc=
ulated using timer frequency.. 2880.00 BogoMIPS (lpj=3D1440000)
Nov 15 15:21:48 fedora kernel: CPU0: Thermal monitoring enabled (TM1)
Nov 15 15:21:48 fedora kernel: Last level iTLB entries: 4KB 48, 2MB 0, 4MB =
0
Nov 15 15:21:48 fedora kernel: Last level dTLB entries: 4KB 256, 2MB 16, 4M=
B 16, 1GB 0
Nov 15 15:21:48 fedora kernel: process: using mwait in idle threads
Nov 15 15:21:48 fedora kernel: mitigations: Enabled attack vectors: user_ke=
rnel, user_user, guest_host, guest_guest, SMT mitigations: auto
Nov 15 15:21:48 fedora kernel: Spectre V2 : Mitigation: Retpolines
Nov 15 15:21:48 fedora kernel: MDS: Mitigation: Clear CPU buffers
Nov 15 15:21:48 fedora kernel: Spectre V1 : Mitigation: usercopy/swapgs bar=
riers and __user pointer sanitization
Nov 15 15:21:48 fedora kernel: Spectre V2 : Spectre v2 / SpectreRSB: Fillin=
g RSB on context switch and VMEXIT
Nov 15 15:21:48 fedora kernel: Spectre V2 : Enabling Restricted Speculation=
 for firmware calls
Nov 15 15:21:48 fedora kernel: Spectre V2 : mitigation: Enabling conditiona=
l Indirect Branch Prediction Barrier
Nov 15 15:21:48 fedora kernel: x86/fpu: x87 FPU will use FXSAVE
Nov 15 15:21:48 fedora kernel: pid_max: default: 32768 minimum: 301
Nov 15 15:21:48 fedora kernel: Yama: becoming mindful.
Nov 15 15:21:48 fedora kernel: SELinux: =C2=A0Initializing.
Nov 15 15:21:48 fedora kernel: LSM support for eBPF active
Nov 15 15:21:48 fedora kernel: landlock: Up and running.
Nov 15 15:21:48 fedora kernel: Mount-cache hash table entries: 8192 (order:=
 4, 65536 bytes, linear)
Nov 15 15:21:48 fedora kernel: Mountpoint-cache hash table entries: 8192 (o=
rder: 4, 65536 bytes, linear)
Nov 15 15:21:48 fedora kernel: VFS: Finished mounting rootfs on nullfs
Nov 15 15:21:48 fedora kernel: smpboot: CPU0: Intel(R) Atom(TM) x5-Z8350 =
=C2=A0CPU @ 1.44GHz (family: 0x6, model: 0x4c, stepping: 0x4)
Nov 15 15:21:48 fedora kernel: Performance Events: PEBS fmt2+, 8-deep LBR, =
Silvermont events, 8-deep LBR, full-width counters, Intel PMU driver.
Nov 15 15:21:48 fedora kernel: ... version: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3
Nov 15 15:21:48 fedora kernel: ... bit width: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 40
Nov 15 15:21:48 fedora kernel: ... generic counters: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02
Nov 15 15:21:48 fedora kernel: ... generic bitmap: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00000000000000003
Nov 15 15:21:48 fedora kernel: ... fixed-purpose counters: =C2=A0 =C2=A03
Nov 15 15:21:48 fedora kernel: ... fixed-purpose bitmap: =C2=A0 =C2=A0 =
=C2=A00000000000000007
Nov 15 15:21:48 fedora kernel: ... value mask: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0000000ffffffffff
Nov 15 15:21:48 fedora kernel: ... max period: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000007fffffffff
Nov 15 15:21:48 fedora kernel: ... global_ctrl mask: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00000000700000003
Nov 15 15:21:48 fedora kernel: signal: max sigframe size: 1440
Nov 15 15:21:48 fedora kernel: Estimated ratio of average max frequency by =
base frequency (times 1024): 1365
Nov 15 15:21:48 fedora kernel: rcu: Hierarchical SRCU implementation.
Nov 15 15:21:48 fedora kernel: rcu: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Max phase n=
o-delay instances is 400.
Nov 15 15:21:48 fedora kernel: Timer migration: 1 hierarchy levels; 8 child=
ren per group; 1 crossnode level
Nov 15 15:21:48 fedora kernel: NMI watchdog: Enabled. Permanently consumes =
one hw-PMU counter.
Nov 15 15:21:48 fedora kernel: smp: Bringing up secondary CPUs ...
Nov 15 15:21:48 fedora kernel: smpboot: x86: Booting SMP configuration:
Nov 15 15:21:48 fedora kernel: .... node =C2=A0#0, CPUs: =C2=A0 =C2=A0 =
=C2=A0#1 #2 #3
Nov 15 15:21:48 fedora kernel: smp: Brought up 1 node, 4 CPUs
Nov 15 15:21:48 fedora kernel: smpboot: Total of 4 processors activated (11=
520.00 BogoMIPS)
Nov 15 15:21:48 fedora kernel: Memory: 3719172K/4055232K available (24755K =
kernel code, 4819K rwdata, 18976K rodata, 5372K init, 6200K bss, 324116K re=
served, 0K cma-reserved)
Nov 15 15:21:48 fedora kernel: devtmpfs: initialized
Nov 15 15:21:48 fedora kernel: x86/mm: Memory block size: 128MB
Nov 15 15:21:48 fedora kernel: ACPI: PM: Registering ACPI NVS region [mem 0=
x0008f000-0x0008ffff] (4096 bytes)
Nov 15 15:21:48 fedora kernel: ACPI: PM: Registering ACPI NVS region [mem 0=
x7a25c000-0x7a35bfff] (1048576 bytes)
Nov 15 15:21:48 fedora kernel: ACPI: PM: Registering ACPI NVS region [mem 0=
x7a446000-0x7ad45fff] (9437184 bytes)
Nov 15 15:21:48 fedora kernel: posixtimers hash table entries: 2048 (order:=
 3, 32768 bytes, linear)
Nov 15 15:21:48 fedora kernel: futex hash table entries: 1024 (65536 bytes =
on 1 NUMA nodes, total 64 KiB, linear).
Nov 15 15:21:48 fedora kernel: PM: RTC time: 14:21:45, date: 2026-11-15
Nov 15 15:21:48 fedora kernel: NET: Registered PF_NETLINK/PF_ROUTE protocol=
 family
Nov 15 15:21:48 fedora kernel: DMA: preallocated 512 KiB GFP_KERNEL pool fo=
r atomic allocations
Nov 15 15:21:48 fedora kernel: DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA=
 pool for atomic allocations
Nov 15 15:21:48 fedora kernel: DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA=
32 pool for atomic allocations
Nov 15 15:21:48 fedora kernel: audit: initializing netlink subsys (disabled=
)
Nov 15 15:21:48 fedora kernel: audit: type=3D2000 audit(1794752505.019:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
Nov 15 15:21:48 fedora kernel: thermal_sys: Registered thermal governor 'fa=
ir_share'
Nov 15 15:21:48 fedora kernel: thermal_sys: Registered thermal governor 'ba=
ng_bang'
Nov 15 15:21:48 fedora kernel: thermal_sys: Registered thermal governor 'st=
ep_wise'
Nov 15 15:21:48 fedora kernel: thermal_sys: Registered thermal governor 'us=
er_space'
Nov 15 15:21:48 fedora kernel: cpuidle: using governor menu
Nov 15 15:21:48 fedora kernel: efi: Freeing EFI boot services memory: 49080=
K
Nov 15 15:21:48 fedora kernel: acpiphp: ACPI Hot Plug PCI Controller Driver=
 version: 0.5
Nov 15 15:21:48 fedora kernel: PCI: ECAM [mem 0xe0000000-0xe3ffffff] (base =
0xe0000000) for domain 0000 [bus 00-3f]
Nov 15 15:21:48 fedora kernel: PCI: Using configuration type 1 for base acc=
ess
Nov 15 15:21:48 fedora kernel: virt/tdx: TDX not supported by the host plat=
form
Nov 15 15:21:48 fedora kernel: kprobes: kprobe jump-optimization is enabled=
. All kprobes are optimized if possible.
Nov 15 15:21:48 fedora kernel: HugeTLB: registered 2.00 MiB page size, pre-=
allocated 0 pages
Nov 15 15:21:48 fedora kernel: HugeTLB: 28 KiB vmemmap can be freed for a 2=
.00 MiB page
Nov 15 15:21:48 fedora kernel: raid6: using ssse3x2 recovery algorithm
Nov 15 15:21:48 fedora kernel: ACPI: Added _OSI(Module Device)
Nov 15 15:21:48 fedora kernel: ACPI: Added _OSI(Processor Device)
Nov 15 15:21:48 fedora kernel: ACPI: Added _OSI(Processor Aggregator Device=
)
Nov 15 15:21:48 fedora kernel: ACPI: 9 ACPI AML tables successfully acquire=
d and loaded
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_: platform _OSC: OS support mask =
[006e7eff]
Nov 15 15:21:48 fedora kernel: ACPI: Dynamic OEM Table Load:
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0xFFFF8BFA011BD800 00059C (v01 Pm=
Ref =C2=A0Cpu0Ist =C2=A000003000 INTL 20130117)
Nov 15 15:21:48 fedora kernel: ACPI: Dynamic OEM Table Load:
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0xFFFF8BFA00B60800 0003A5 (v01 Pm=
Ref =C2=A0Cpu0Cst =C2=A000003001 INTL 20130117)
Nov 15 15:21:48 fedora kernel: ACPI: Dynamic OEM Table Load:
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0xFFFF8BFA003E1600 00015F (v01 Pm=
Ref =C2=A0ApIst =C2=A0 =C2=A000003000 INTL 20130117)
Nov 15 15:21:48 fedora kernel: ACPI: Dynamic OEM Table Load:
Nov 15 15:21:48 fedora kernel: ACPI: SSDT 0xFFFF8BFA00122000 00008D (v01 Pm=
Ref =C2=A0ApCst =C2=A0 =C2=A000003000 INTL 20130117)
Nov 15 15:21:48 fedora kernel: ACPI: Interpreter enabled
Nov 15 15:21:48 fedora kernel: ACPI: PM: (supports S0 S4 S5)
Nov 15 15:21:48 fedora kernel: ACPI: Using IOAPIC for interrupt routing
Nov 15 15:21:48 fedora kernel: PCI: Using host bridge windows from ACPI; if=
 necessary, use "pci=3Dnocrs" and report a bug
Nov 15 15:21:48 fedora kernel: PCI: Using E820 reservations for host bridge=
 windows
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.USBC: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.HS03.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.HS13.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.SSC1.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.SSCW.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.HSC1.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.XHC1.RHUB.HSC3.WWPR: New po=
wer resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C1.CLK2: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C1.CLK4: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C1.P28P: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C1.P18P: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C1.P12P: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C2.CLK2: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C2.CLK3: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C2.CLK4: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P18P: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P28P: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C3.CLK2: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C3.CLK1: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C5.CLK5: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C6.P33P: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C6.P65P: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.ISP3.ID3C: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P06X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P28X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P18X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P12X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P19X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P12A: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P28T: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P18D: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P18T: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P3P3: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P12T: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P28W: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P18W: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P12W: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P33W: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P33X: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.P4BW: New power resource
Nov 15 15:21:48 fedora kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [b=
us 00-ff])
Nov 15 15:21:48 fedora kernel: acpi PNP0A08:00: _OSC: OS supports [Extended=
Config ASPM ClockPM Segments MSI EDR HPX-Type3]
Nov 15 15:21:48 fedora kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIe=
Hotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
Nov 15 15:21:48 fedora kernel: acpi PNP0A08:00: [Firmware Info]: ECAM [mem =
0xe0000000-0xe3ffffff] for domain 0000 [bus 00-3f] only partially covers th=
is bridge
Nov 15 15:21:48 fedora kernel: PCI host bridge to bus 0000:00
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [io =
=C2=A00x0070-0x0077]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [io =
=C2=A00x0000-0x006f window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [io =
=C2=A00x0078-0x0cf7 window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [io =
=C2=A00x0d00-0xffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [mem 0x00=
0a0000-0x000fffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [mem 0x20=
000000-0x201fffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [mem 0x7c=
c00001-0x7ec00000 window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [mem 0x80=
000000-0xdfffffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: root bus resource [bus 00-f=
f]
Nov 15 15:21:48 fedora kernel: pci 0000:00:00.0: [8086:2280] type 00 class =
0x060000 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: [8086:22b0] type 00 class =
0x030000 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: BAR 0 [mem 0x90000000-0x90=
ffffff 64bit]
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: BAR 2 [mem 0x80000000-0x8f=
ffffff 64bit pref]
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: BAR 4 [io =C2=A00x1000-0x1=
03f]
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: Video device with shadowed=
 ROM at [mem 0x000c0000-0x000dffff]
Nov 15 15:21:48 fedora kernel: pci 0000:00:03.0: [8086:22b8] type 00 class =
0x048000 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:03.0: BAR 0 [mem 0x91000000-0x91=
3fffff]
Nov 15 15:21:48 fedora kernel: pci 0000:00:0b.0: [8086:22dc] type 00 class =
0x118000 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:0b.0: BAR 0 [mem 0x91818000-0x91=
818fff 64bit]
Nov 15 15:21:48 fedora kernel: pci 0000:00:14.0: [8086:22b5] type 00 class =
0x0c0330 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:14.0: BAR 0 [mem 0x91800000-0x91=
80ffff 64bit]
Nov 15 15:21:48 fedora kernel: pci 0000:00:14.0: PME# supported from D3hot =
D3cold
Nov 15 15:21:48 fedora kernel: pci 0000:00:1a.0: [8086:2298] type 00 class =
0x108000 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: pci 0000:00:1a.0: BAR 0 [mem 0x91700000-0x91=
7fffff]
Nov 15 15:21:48 fedora kernel: pci 0000:00:1a.0: BAR 1 [mem 0x91600000-0x91=
6fffff]
Nov 15 15:21:48 fedora kernel: pci 0000:00:1a.0: PME# supported from D0 D3h=
ot
Nov 15 15:21:48 fedora kernel: pci 0000:00:1f.0: [8086:229c] type 00 class =
0x060100 conventional PCI endpoint
Nov 15 15:21:48 fedora kernel: Low-power S0 idle used by default for system=
 suspend
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKA configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKA disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKB configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKB disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKC configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKC disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKD configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKD disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKE configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKE disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKF configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKF disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKG configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKG disabled
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKH configured fo=
r IRQ 0
Nov 15 15:21:48 fedora kernel: ACPI: PCI: Interrupt link LNKH disabled
Nov 15 15:21:48 fedora kernel: cherryview-pinctrl INT33FF:04: probe with dr=
iver cherryview-pinctrl failed with error -61
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C4.CLK0: New power resour=
ce
Nov 15 15:21:48 fedora kernel: ACPI: \_SB_.PCI0.I2C4.CLK1: New power resour=
ce
Nov 15 15:21:48 fedora kernel: iommu: Default domain type: Translated
Nov 15 15:21:48 fedora kernel: iommu: DMA domain TLB invalidation policy: l=
azy mode
Nov 15 15:21:48 fedora kernel: SCSI subsystem initialized
Nov 15 15:21:48 fedora kernel: libata version 3.00 loaded.
Nov 15 15:21:48 fedora kernel: ACPI: bus type USB registered
Nov 15 15:21:48 fedora kernel: usbcore: registered new interface driver usb=
fs
Nov 15 15:21:48 fedora kernel: usbcore: registered new interface driver hub
Nov 15 15:21:48 fedora kernel: usbcore: registered new device driver usb
Nov 15 15:21:48 fedora kernel: pps_core: LinuxPPS API ver. 1 registered
Nov 15 15:21:48 fedora kernel: pps_core: Software ver. 5.3.6 - Copyright 20=
05-2007 Rodolfo Giometti <giometti@linux.it>
Nov 15 15:21:48 fedora kernel: PTP clock support registered
Nov 15 15:21:48 fedora kernel: EDAC MC: Ver: 3.0.0
Nov 15 15:21:48 fedora kernel: efivars: Registered efivars operations
Nov 15 15:21:48 fedora kernel: NetLabel: Initializing
Nov 15 15:21:48 fedora kernel: NetLabel: =C2=A0domain hash size =3D 128
Nov 15 15:21:48 fedora kernel: NetLabel: =C2=A0protocols =3D UNLABELED CIPS=
Ov4 CALIPSO
Nov 15 15:21:48 fedora kernel: NetLabel: =C2=A0unlabeled traffic allowed by=
 default
Nov 15 15:21:48 fedora kernel: mctp: management component transport protoco=
l core
Nov 15 15:21:48 fedora kernel: NET: Registered PF_MCTP protocol family
Nov 15 15:21:48 fedora kernel: PCI: Using ACPI for IRQ routing
Nov 15 15:21:48 fedora kernel: PCI: pci_cache_line_size set to 64 bytes
Nov 15 15:21:48 fedora kernel: resource: Expanded resource Reserved due to =
conflict with PCI Bus 0000:00
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x00=
08f000-0x0008ffff]
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x1f=
000000-0x1fffffff]
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x73=
73f000-0x73ffffff]
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x75=
323000-0x77ffffff]
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x77=
730000-0x77ffffff]
Nov 15 15:21:48 fedora kernel: e820: register RAM buffer resource [mem 0x7a=
446000-0x7bffffff]
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: vgaarb: setting as boot VG=
A device
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: vgaarb: bridge control pos=
sible
Nov 15 15:21:48 fedora kernel: pci 0000:00:02.0: vgaarb: VGA device added: =
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
Nov 15 15:21:48 fedora kernel: vgaarb: loaded
Nov 15 15:21:48 fedora kernel: clocksource: Switched to clocksource tsc-ear=
ly
Nov 15 15:21:48 fedora kernel: VFS: Disk quotas dquot_6.6.0
Nov 15 15:21:48 fedora kernel: VFS: Dquot-cache hash table entries: 512 (40=
96 bytes)
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x004e-0x=
004f]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0061]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0063]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0065]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0067]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0070]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0080-0x=
008f]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x0092]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Skipped [io =C2=A00x00b2-0x=
00b3]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Reserved [io =C2=A00x0680-0=
x069f]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Reserved [io =C2=A00x0400-0=
x047f]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:00: Reserved [io =C2=A00x0500-0=
x05fe]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9183a000-0x=
9183afff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91838000-0x=
91838fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91836000-0x=
91836fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91825000-0x=
91825fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91823000-0x=
91823fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91821000-0x=
91821fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9181f000-0x=
9181ffff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9181d000-0x=
9181dfff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9181b000-0x=
9181bfff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91819000-0x=
91819fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91834000-0x=
91834fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91832000-0x=
91832fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91830000-0x=
91830fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9182e000-0x=
9182efff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9182c000-0x=
9182cfff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x9182a000-0x=
9182afff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91828000-0x=
91828fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:01: Reserved [mem 0x91826000-0x=
91826fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Could not reserve [mem 0xe0=
000000-0xefffffff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfea00000-0x=
feafffff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfed01000-0x=
fed01fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfed03000-0x=
fed03fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfed06000-0x=
fed06fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfed08000-0x=
fed09fff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Could not reserve [mem 0xfe=
d80000-0xfedbffff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Reserved [mem 0xfed1c000-0x=
fed1cfff]
Nov 15 15:21:48 fedora kernel: acpi PNP0C02:02: Could not reserve [mem 0xfe=
e00000-0xfeefffff]
Nov 15 15:21:48 fedora kernel: pnp: PnP ACPI init
Nov 15 15:21:48 fedora kernel: pnp: PnP ACPI: found 1 devices
Nov 15 15:21:48 fedora kernel: clocksource: acpi_pm: mask: 0xffffff max_cyc=
les: 0xffffff, max_idle_ns: 2085701024 ns
Nov 15 15:21:48 fedora kernel: NET: Registered PF_INET protocol family
Nov 15 15:21:48 fedora kernel: IP idents hash table entries: 65536 (order: =
7, 524288 bytes, linear)
Nov 15 15:21:48 fedora kernel: tcp_listen_portaddr_hash hash table entries:=
 2048 (order: 3, 32768 bytes, linear)
Nov 15 15:21:48 fedora kernel: Table-perturb hash table entries: 65536 (ord=
er: 6, 262144 bytes, linear)
Nov 15 15:21:48 fedora kernel: TCP established hash table entries: 32768 (o=
rder: 6, 262144 bytes, linear)
Nov 15 15:21:48 fedora kernel: TCP bind hash table entries: 32768 (order: 8=
, 1048576 bytes, linear)
Nov 15 15:21:48 fedora kernel: TCP: Hash tables configured (established 327=
68 bind 32768)
Nov 15 15:21:48 fedora kernel: MPTCP token hash table entries: 4096 (order:=
 5, 98304 bytes, linear)
Nov 15 15:21:48 fedora kernel: UDP hash table entries: 2048 (order: 5, 1310=
72 bytes, linear)
Nov 15 15:21:48 fedora kernel: NET: Registered PF_UNIX/PF_LOCAL protocol fa=
mily
Nov 15 15:21:48 fedora kernel: NET: Registered PF_XDP protocol family
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 4 [io =C2=A00x0070=
-0x0077]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 5 [io =C2=A00x0000=
-0x006f window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 6 [io =C2=A00x0078=
-0x0cf7 window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 7 [io =C2=A00x0d00=
-0xffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 8 [mem 0x000a0000-=
0x000fffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 9 [mem 0x20000000-=
0x201fffff window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 10 [mem 0x7cc00001=
-0x7ec00000 window]
Nov 15 15:21:48 fedora kernel: pci_bus 0000:00: resource 11 [mem 0x80000000=
-0xdfffffff window]
Nov 15 15:21:48 fedora kernel: PCI: CLS 64 bytes, default 64
Nov 15 15:21:48 fedora kernel: PCI-DMA: Using software bounce buffering for=
 IO (SWIOTLB)
Nov 15 15:21:48 fedora kernel: software IO TLB: mapped [mem 0x000000006e000=
000-0x0000000072000000] (64MB)
Nov 15 15:21:48 fedora kernel: clocksource: tsc: mask: 0xffffffffffffffff m=
ax_cycles: 0x14c1baf3789, max_idle_ns: 440795266465 ns
Nov 15 15:21:48 fedora kernel: Trying to unpack rootfs image as initramfs..=
.
Nov 15 15:21:48 fedora kernel: clocksource: Switched to clocksource tsc
Nov 15 15:21:48 fedora kernel: Initialise system trusted keyrings
Nov 15 15:21:48 fedora kernel: Key type blacklist registered
Nov 15 15:21:48 fedora kernel: workingset: timestamp_bits=3D36 (anon: 31) m=
ax_order=3D20 bucket_order=3D0 (anon: 0)
Nov 15 15:21:48 fedora kernel: integrity: Platform Keyring initialized
Nov 15 15:21:48 fedora kernel: integrity: Machine keyring initialized
Nov 15 15:21:48 fedora kernel: cryptd: max_cpu_qlen set to 1000
Nov 15 15:21:48 fedora kernel: NET: Registered PF_ALG protocol family
Nov 15 15:21:48 fedora kernel: Key type asymmetric registered
Nov 15 15:21:48 fedora kernel: Asymmetric key parser 'x509' registered
Nov 15 15:21:48 fedora kernel: Block layer SCSI generic (bsg) driver versio=
n 0.4 loaded (major 244)
Nov 15 15:21:48 fedora kernel: io scheduler mq-deadline registered
Nov 15 15:21:48 fedora kernel: io scheduler kyber registered
Nov 15 15:21:48 fedora kernel: io scheduler bfq registered
Nov 15 15:21:48 fedora kernel: xor: measuring software checksum speed
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0prefetch64-sse =C2=A0: 10800 MB=
/sec
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0sse =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 : =C2=A09586 MB/sec
Nov 15 15:21:48 fedora kernel: xor: using function: prefetch64-sse (10800 M=
B/sec)
Nov 15 15:21:48 fedora kernel: raid6: skipped pq benchmark and selected sse=
2x4
Nov 15 15:21:48 fedora kernel: atomic64_test: passed for x86-64 platform wi=
th CX8 and with SSE
Nov 15 15:21:48 fedora kernel: ACPI: found native INT33F4 PMIC, skipping AC=
PI AC and battery devices
Nov 15 15:21:48 fedora kernel: input: Power Button as /devices/platform/PNP=
0C0C:00/input/input0
Nov 15 15:21:48 fedora kernel: ACPI: button: Power Button [PWRB]
Nov 15 15:21:48 fedora kernel: input: Lid Switch as /devices/platform/PNP0C=
0D:00/input/input1
Nov 15 15:21:48 fedora kernel: ACPI: button: Lid Switch [LID0]
Nov 15 15:21:48 fedora kernel: input: Power Button as /devices/platform/LNX=
PWRBN:00/input/input2
Nov 15 15:21:48 fedora kernel: ACPI: button: Power Button [PWRF]
Nov 15 15:21:48 fedora kernel: acpi LNXTHERM:00: registered as thermal_zone=
0
Nov 15 15:21:48 fedora kernel: ACPI: thermal: Thermal Zone [TZ00] (0 C)
Nov 15 15:21:48 fedora kernel: Serial: 8250/16550 driver, 32 ports, IRQ sha=
ring enabled
Nov 15 15:21:48 fedora kernel: 00:00: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud=
 =3D 115200) is a 16550A
Nov 15 15:21:48 fedora kernel: 8086228A:00: ttyS4 MMIO32:0x0000000091822000=
 (irq =3D 39, base_baud =3D 2764800) is a 16550A
Nov 15 15:21:48 fedora kernel: serial serial0: tty port ttyS4 registered
Nov 15 15:21:48 fedora kernel: 8086228A:01: ttyS5 MMIO32:0x0000000091820000=
 (irq =3D 40, base_baud =3D 2764800) is a 16550A
Nov 15 15:21:48 fedora kernel: hpet: number irqs doesn't agree with number =
of timers
Nov 15 15:21:48 fedora kernel: Non-volatile memory driver v1.3
Nov 15 15:21:48 fedora kernel: ACPI: bus type drm_connector registered
Nov 15 15:21:48 fedora kernel: CAN device driver interface
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: new USB bus registere=
d, assigned bus number 1
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c1=
 hci version 0x100 quirks 0x0000000081509810
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: new USB bus registere=
d, assigned bus number 2
Nov 15 15:21:48 fedora kernel: xhci_hcd 0000:00:14.0: Host supports USB 3.0=
 SuperSpeed
Nov 15 15:21:48 fedora kernel: usb usb1: New USB device found, idVendor=3D1=
d6b, idProduct=3D0002, bcdDevice=3D 7.03
Nov 15 15:21:48 fedora kernel: usb usb1: New USB device strings: Mfr=3D3, P=
roduct=3D2, SerialNumber=3D1
Nov 15 15:21:48 fedora kernel: usb usb1: Product: xHCI Host Controller
Nov 15 15:21:48 fedora kernel: usb usb1: Manufacturer: Linux 7.3.3-300.fc45=
.x86_64 xhci-hcd
Nov 15 15:21:48 fedora kernel: usb usb1: SerialNumber: 0000:00:14.0
Nov 15 15:21:48 fedora kernel: hub 1-0:1.0: USB hub found
Nov 15 15:21:48 fedora kernel: hub 1-0:1.0: 7 ports detected
Nov 15 15:21:48 fedora kernel: usb usb2: New USB device found, idVendor=3D1=
d6b, idProduct=3D0003, bcdDevice=3D 7.03
Nov 15 15:21:48 fedora kernel: usb usb2: New USB device strings: Mfr=3D3, P=
roduct=3D2, SerialNumber=3D1
Nov 15 15:21:48 fedora kernel: usb usb2: Product: xHCI Host Controller
Nov 15 15:21:48 fedora kernel: usb usb2: Manufacturer: Linux 7.3.3-300.fc45=
.x86_64 xhci-hcd
Nov 15 15:21:48 fedora kernel: usb usb2: SerialNumber: 0000:00:14.0
Nov 15 15:21:48 fedora kernel: hub 2-0:1.0: USB hub found
Nov 15 15:21:48 fedora kernel: hub 2-0:1.0: 6 ports detected
Nov 15 15:21:48 fedora kernel: usbcore: registered new interface driver usb=
serial_generic
Nov 15 15:21:48 fedora kernel: usbserial: USB Serial support registered for=
 generic
Nov 15 15:21:48 fedora kernel: i8042: PNP: No PS/2 controller found.
Nov 15 15:21:48 fedora kernel: mousedev: PS/2 mouse device common for all m=
ice
Nov 15 15:21:48 fedora kernel: rtc_cmos PNP0B00:00: registered as rtc0
Nov 15 15:21:48 fedora kernel: rtc_cmos PNP0B00:00: setting system clock to=
 2026-11-15T14:21:46 UTC (1794752506)
Nov 15 15:21:48 fedora kernel: rtc_cmos PNP0B00:00: alarms up to one month,=
 y3k, 242 bytes nvram
Nov 15 15:21:48 fedora kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTAB=
LE is disabled. Duplicate IMA measurements will not be recorded in the IMA =
log.
Nov 15 15:21:48 fedora kernel: device-mapper: uevent: version 1.0.3
Nov 15 15:21:48 fedora kernel: device-mapper: ioctl: 4.50.0-ioctl (2025-04-=
28) initialised: dm-devel@lists.linux.dev
Nov 15 15:21:48 fedora kernel: intel_pstate: Intel P-state driver initializ=
ing
Nov 15 15:21:48 fedora kernel: simple-framebuffer simple-framebuffer.0: [dr=
m] Registered 1 planes with drm panic
Nov 15 15:21:48 fedora kernel: [drm] Initialized simpledrm 1.0.0 for simple=
-framebuffer.0 on minor 0
Nov 15 15:21:48 fedora kernel: fbcon: Deferring console take-over
Nov 15 15:21:48 fedora kernel: simple-framebuffer simple-framebuffer.0: [dr=
m] fb0: simpledrmdrmfb frame buffer device
Nov 15 15:21:48 fedora kernel: hid: raw HID events driver (C) Jiri Kosina
Nov 15 15:21:48 fedora kernel: usbcore: registered new interface driver usb=
hid
Nov 15 15:21:48 fedora kernel: usbhid: USB HID core driver
Nov 15 15:21:48 fedora kernel: drop_monitor: Initializing network drop moni=
tor service
Nov 15 15:21:48 fedora kernel: Initializing XFRM netlink socket
Nov 15 15:21:48 fedora kernel: NET: Registered PF_INET6 protocol family
Nov 15 15:21:48 fedora kernel: Segment Routing with IPv6
Nov 15 15:21:48 fedora kernel: RPL Segment Routing with IPv6
Nov 15 15:21:48 fedora kernel: In-situ OAM (IOAM) with IPv6
Nov 15 15:21:48 fedora kernel: mip6: Mobile IPv6
Nov 15 15:21:48 fedora kernel: NET: Registered PF_PACKET protocol family
Nov 15 15:21:48 fedora kernel: can: controller area network core
Nov 15 15:21:48 fedora kernel: NET: Registered PF_CAN protocol family
Nov 15 15:21:48 fedora kernel: ENERGY_PERF_BIAS: Set to 'normal', was 'perf=
ormance'
Nov 15 15:21:48 fedora kernel: microcode: Current revision: 0x00000411
Nov 15 15:21:48 fedora kernel: microcode: Updated early from: 0x0000040a
Nov 15 15:21:48 fedora kernel: IPI shorthand broadcast: enabled
Nov 15 15:21:48 fedora kernel: sched_clock: Marking stable (1382003666, 371=
4075)->(1470033425, -84315684)
Nov 15 15:21:48 fedora kernel: registered taskstats version 1
Nov 15 15:21:48 fedora kernel: Loading compiled-in X.509 certificates
Nov 15 15:21:48 fedora kernel: alg: No test for mldsa87 (mldsa87-lib)
Nov 15 15:21:48 fedora kernel: Loaded X.509 cert 'Fedora kernel signing key=
: 5f8d73dcd4f6ce802cff6fac9cedf38a923149b2'
Nov 15 15:21:48 fedora kernel: usb 1-2: new low-speed USB device number 2 u=
sing xhci_hcd
Nov 15 15:21:48 fedora kernel: usb 1-2: New USB device found, idVendor=3D25=
8a, idProduct=3D1015, bcdDevice=3D 1.17
Nov 15 15:21:48 fedora kernel: usb 1-2: New USB device strings: Mfr=3D1, Pr=
oduct=3D2, SerialNumber=3D3
Nov 15 15:21:48 fedora kernel: usb 1-2: Product: USB Composite Device
Nov 15 15:21:48 fedora kernel: usb 1-2: Manufacturer: SIPODEV
Nov 15 15:21:48 fedora kernel: usb 1-2: SerialNumber: SP-1029H-US-16-17-12
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device as /devi=
ces/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:258A:1015.0001/input/inpu=
t3
Nov 15 15:21:48 fedora kernel: hid-generic 0003:258A:1015.0001: input,hidra=
w0: USB HID v1.10 Keyboard [SIPODEV USB Composite Device] on usb-0000:00:14=
.0-2/input0
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device Mouse as=
 /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:258A:1015.0002/inpu=
t/input4
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device System C=
ontrol as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:258A:1015.=
0002/input/input5
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device Consumer=
 Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:258A:101=
5.0002/input/input6
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device as /devi=
ces/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:258A:1015.0002/input/inpu=
t7
Nov 15 15:21:48 fedora kernel: input: SIPODEV USB Composite Device Wireless=
 Radio Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:25=
8A:1015.0002/input/input8
Nov 15 15:21:48 fedora kernel: hid-generic 0003:258A:1015.0002: input,hidde=
v96,hidraw1: USB HID v1.10 Mouse [SIPODEV USB Composite Device] on usb-0000=
:00:14.0-2/input1
Nov 15 15:21:48 fedora kernel: usb 1-4: new high-speed USB device number 3 =
using xhci_hcd
Nov 15 15:21:48 fedora kernel: usb 1-4: New USB device found, idVendor=3D05=
e3, idProduct=3D0608, bcdDevice=3D85.36
Nov 15 15:21:48 fedora kernel: usb 1-4: New USB device strings: Mfr=3D0, Pr=
oduct=3D1, SerialNumber=3D0
Nov 15 15:21:48 fedora kernel: usb 1-4: Product: USB2.0 Hub
Nov 15 15:21:48 fedora kernel: hub 1-4:1.0: USB hub found
Nov 15 15:21:48 fedora kernel: hub 1-4:1.0: 4 ports detected
Nov 15 15:21:48 fedora kernel: Freeing initrd memory: 62544K
Nov 15 15:21:48 fedora kernel: Loaded X.509 cert 'Fedora IMA CA: a8a00c3166=
3f853f9c6ff2564872e378af026b28'
Nov 15 15:21:48 fedora kernel: Demotion targets for Node 0: null
Nov 15 15:21:48 fedora kernel: page_owner is disabled
Nov 15 15:21:48 fedora kernel: Key type .fscrypt registered
Nov 15 15:21:48 fedora kernel: Key type fscrypt-provisioning registered
Nov 15 15:21:48 fedora kernel: Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
Nov 15 15:21:48 fedora kernel: Key type big_key registered
Nov 15 15:21:48 fedora kernel: Key type trusted registered
Nov 15 15:21:48 fedora kernel: Key type encrypted registered
Nov 15 15:21:48 fedora kernel: Loading compiled-in module X.509 certificate=
s
Nov 15 15:21:48 fedora kernel: Loaded X.509 cert 'Fedora kernel signing key=
: 5f8d73dcd4f6ce802cff6fac9cedf38a923149b2'
Nov 15 15:21:48 fedora kernel: ima: Allocated hash algorithm: sha256
Nov 15 15:21:48 fedora kernel: ima: No architecture policies found
Nov 15 15:21:48 fedora kernel: evm: Initialising EVM extended attributes:
Nov 15 15:21:48 fedora kernel: evm: security.selinux
Nov 15 15:21:48 fedora kernel: evm: security.SMACK64 (disabled)
Nov 15 15:21:48 fedora kernel: evm: security.SMACK64EXEC (disabled)
Nov 15 15:21:48 fedora kernel: evm: security.SMACK64TRANSMUTE (disabled)
Nov 15 15:21:48 fedora kernel: evm: security.SMACK64MMAP (disabled)
Nov 15 15:21:48 fedora kernel: evm: security.apparmor (disabled)
Nov 15 15:21:48 fedora kernel: evm: security.ima
Nov 15 15:21:48 fedora kernel: evm: security.capability
Nov 15 15:21:48 fedora kernel: evm: HMAC attrs: 0x1
Nov 15 15:21:48 fedora kernel: alg: No test for 842 (842-scomp)
Nov 15 15:21:48 fedora kernel: alg: No test for mldsa65 (mldsa65-lib)
Nov 15 15:21:48 fedora kernel: alg: No test for mldsa44 (mldsa44-lib)
Nov 15 15:21:48 fedora kernel: i2c_designware 808622C1:05: I2C bus managed =
by PUNIT
Nov 15 15:21:48 fedora kernel: axp20x-i2c i2c-INT33F4:00: AXP20x variant AX=
P288 found
Nov 15 15:21:48 fedora kernel: axp20x-i2c i2c-INT33F4:00: AXP20X driver loa=
ded
Nov 15 15:21:48 fedora kernel: PM: =C2=A0 Magic number: 2:466:384
Nov 15 15:21:48 fedora kernel: usb usb2: hash matches
Nov 15 15:21:48 fedora kernel: cherryview-pinctrl INT33FF:02: hash matches
Nov 15 15:21:48 fedora kernel: RAS: Correctable Errors collector initialize=
d.
Nov 15 15:21:48 fedora kernel: clk: Disabling unused clocks
Nov 15 15:21:48 fedora kernel: PM: genpd: Disabling unused power domains
Nov 15 15:21:48 fedora kernel: Freeing unused decrypted memory: 2028K
Nov 15 15:21:48 fedora kernel: Freeing unused kernel image (initmem) memory=
: 5372K
Nov 15 15:21:48 fedora kernel: Write protecting the kernel read-only data: =
47104k
Nov 15 15:21:48 fedora kernel: Freeing unused kernel image (text/rodata gap=
) memory: 1868K
Nov 15 15:21:48 fedora kernel: Freeing unused kernel image (rodata/data gap=
) memory: 1504K
Nov 15 15:21:48 fedora kernel: x86/mm: Checked W+X mappings: passed, no W+X=
 pages found.
Nov 15 15:21:48 fedora kernel: x86/mm: Checking user space page tables
Nov 15 15:21:48 fedora kernel: x86/mm: Checked W+X mappings: passed, no W+X=
 pages found.
Nov 15 15:21:48 fedora kernel: Run /init as init process
Nov 15 15:21:48 fedora kernel: =C2=A0 with arguments:
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 /init
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 rhgb
Nov 15 15:21:48 fedora kernel: =C2=A0 with environment:
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 HOME=3D/
Nov 15 15:21:48 fedora kernel: =C2=A0 =C2=A0 TERM=3Dlinux
Nov 15 15:21:48 fedora systemd[1]: Successfully made /usr/ read-only.
Nov 15 15:21:48 fedora systemd[1]: systemd 262.1-1.fc45 running in system m=
ode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +IPE +SMACK +SECCOMP +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPT=
SETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +L=
Z4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
Nov 15 15:21:48 fedora systemd[1]: Detected architecture x86-64.
Nov 15 15:21:48 fedora systemd[1]: Running in initrd.
Nov 15 15:21:48 fedora systemd[1]: No hostname configured, using default ho=
stname.
Nov 15 15:21:48 fedora systemd[1]: Hostname set to <fedora>.
Nov 15 15:21:48 fedora systemd[1]: bpf-restrict-fs: LSM BPF program attache=
d
Nov 15 15:21:48 fedora systemd[1]: Queued start job for default target init=
rd.target.
Nov 15 15:21:48 fedora systemd[1]: Expecting device dev-disk-by\x2duuid-7b0=
58820\x2db885\x2d4f5a\x2d9c19\x2de76481acd1b7.device - /dev/disk/by-uuid/7b=
058820-b885-4f5a-9c19-e76481acd1b7...
Nov 15 15:21:48 fedora systemd[1]: Reached target initrd-usr-fs.target - In=
itrd /usr File System.
Nov 15 15:21:48 fedora systemd[1]: Reached target slices.target - Slice Uni=
ts.
Nov 15 15:21:48 fedora systemd[1]: Reached target swap.target - Swaps.
Nov 15 15:21:48 fedora systemd[1]: Reached target timers.target - Timer Uni=
ts.
Nov 15 15:21:48 fedora systemd[1]: Listening on systemd-journald-dev-log.so=
cket - Journal Socket (/dev/log).
Nov 15 15:21:48 fedora systemd[1]: Listening on systemd-journald.socket - J=
ournal Sockets.
Nov 15 15:21:48 fedora systemd[1]: Listening on systemd-udevd-kernel.socket=
 - udev Kernel Socket.
Nov 15 15:21:48 fedora systemd[1]: Listening on systemd-udevd-varlink.socke=
t - udev Varlink Socket.
Nov 15 15:21:48 fedora systemd[1]: Reached target sockets.target - Socket U=
nits.
Nov 15 15:21:48 fedora systemd[1]: Starting kmod-static-nodes.service - Cre=
ate List of Static Device Nodes...
Nov 15 15:21:48 fedora systemd[1]: memstrack.service - Memstrack Anylazing =
Service skipped, no trigger condition checks were met.
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-journald.service - Jour=
nal Service...
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-modules-load.service - =
Load Kernel Modules...
Nov 15 15:21:48 fedora systemd[1]: systemd-pcrphase-initrd.service - TPM PC=
R Barrier (initrd) skipped, unmet condition check ConditionSecurity=3Dmeasu=
red-os
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-vconsole-setup.service =
- Virtual Console Setup...
Nov 15 15:21:48 fedora systemd[1]: Finished kmod-static-nodes.service - Cre=
ate List of Static Device Nodes.
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-tmpfiles-setup-dev-earl=
y.service - Create Static Device Nodes in /dev gracefully...
Nov 15 15:21:48 fedora kernel: i2c_dev: i2c /dev entries driver
Nov 15 15:21:48 fedora systemd[1]: Finished systemd-tmpfiles-setup-dev-earl=
y.service - Create Static Device Nodes in /dev gracefully.
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-tmpfiles-setup-dev.serv=
ice - Create Static Device Nodes in /dev...
Nov 15 15:21:48 fedora systemd-journald[196]: Collecting audit messages is =
disabled.
Nov 15 15:21:48 fedora systemd[1]: Finished systemd-tmpfiles-setup-dev.serv=
ice - Create Static Device Nodes in /dev.
Nov 15 15:21:48 fedora systemd[1]: Reached target local-fs-pre.target - Pre=
paration for Local File Systems.
Nov 15 15:21:48 fedora systemd[1]: Reached target local-fs.target - Local F=
ile Systems.
Nov 15 15:21:48 fedora kernel: fuse: init (API version 7.46)
Nov 15 15:21:48 fedora systemd[1]: Finished systemd-modules-load.service - =
Load Kernel Modules.
Nov 15 15:21:48 fedora systemd[1]: Starting systemd-sysctl.service - Apply =
Kernel Variables...
Nov 15 15:21:48 fedora systemd[1]: Finished systemd-sysctl.service - Apply =
Kernel Variables.
Nov 15 15:21:48 fedora systemd[1]: Started systemd-journald.service - Journ=
al Service.
Nov 15 15:21:51 fedora kernel: dw_dmac INTL9C60:00: DesignWare DMA Controll=
er, 8 channels
Nov 15 15:21:51 fedora kernel: dw_dmac INTL9C60:01: DesignWare DMA Controll=
er, 8 channels
Nov 15 15:21:51 fedora kernel: mmc2: SDHCI controller on ACPI [80860F14:02]=
 using ADMA
Nov 15 15:21:51 fedora kernel: mmc0: SDHCI controller on ACPI [80860F14:00]=
 using ADMA
Nov 15 15:21:51 fedora kernel: mmc1: SDHCI controller on ACPI [80860F14:03]=
 using ADMA
Nov 15 15:21:51 fedora kernel: mmc2: new high speed SDIO card at address 00=
01
Nov 15 15:21:51 fedora kernel: mmc0: new HS200 MMC card at address 0001
Nov 15 15:21:51 fedora kernel: input: gpio-keys as /devices/platform/ACPI00=
11:00/gpio-keys.1.auto/input/input9
Nov 15 15:21:51 fedora kernel: input: gpio-keys as /devices/platform/ACPI00=
11:00/gpio-keys.2.auto/input/input10
Nov 15 15:21:51 fedora kernel: input: gpio-keys as /devices/platform/INT33D=
3:00/gpio-keys.3.auto/input/input11
Nov 15 15:21:51 fedora kernel: input: FTSC1000:00 2808:1015 Touchscreen as =
/devices/pci0000:00/808622C1:04/i2c-4/i2c-FTSC1000:00/0018:2808:1015.0003/i=
nput/input12
Nov 15 15:21:51 fedora kernel: input: FTSC1000:00 2808:1015 as /devices/pci=
0000:00/808622C1:04/i2c-4/i2c-FTSC1000:00/0018:2808:1015.0003/input/input14
Nov 15 15:21:51 fedora kernel: hid-generic 0018:2808:1015.0003: input,hidra=
w2: I2C HID v1.00 Device [FTSC1000:00 2808:1015] on i2c-FTSC1000:00
Nov 15 15:21:51 fedora kernel: mmcblk0: mmc0:0001 DF4064 58.2 GiB
Nov 15 15:21:51 fedora kernel: =C2=A0mmcblk0: p1 p2 p3 p4
Nov 15 15:21:51 fedora kernel: mmcblk0boot0: mmc0:0001 DF4064 4.00 MiB
Nov 15 15:21:51 fedora kernel: mmcblk0boot1: mmc0:0001 DF4064 4.00 MiB
Nov 15 15:21:51 fedora kernel: input: FTSC1000:00 2808:1015 as /devices/pci=
0000:00/808622C1:04/i2c-4/i2c-FTSC1000:00/0018:2808:1015.0003/input/input15
Nov 15 15:21:51 fedora kernel: input: FTSC1000:00 2808:1015 UNKNOWN as /dev=
ices/pci0000:00/808622C1:04/i2c-4/i2c-FTSC1000:00/0018:2808:1015.0003/input=
/input17
Nov 15 15:21:51 fedora kernel: hid-multitouch 0018:2808:1015.0003: input,hi=
draw2: I2C HID v1.00 Device [FTSC1000:00 2808:1015] on i2c-FTSC1000:00
Nov 15 15:21:51 fedora kernel: mmcblk0rpmb: mmc0:0001 DF4064 4.00 MiB, char=
dev (237:0)
Nov 15 15:21:54 fedora kernel: i915 0000:00:02.0: [drm] Found cherryview (d=
evice ID 22b0) integrated display version 8.00 stepping N/A
Nov 15 15:21:54 fedora kernel: i915 0000:00:02.0: vgaarb: deactivate vga co=
nsole
Nov 15 15:21:54 fedora kernel: i915 0000:00:02.0: [drm] Registered 3 planes=
 with drm panic
Nov 15 15:21:54 fedora kernel: [drm] Initialized i915 1.6.0 for 0000:00:02.=
0 on minor 1
Nov 15 15:21:54 fedora kernel: ACPI: video: Video Device [GFX0] (multi-head=
: yes =C2=A0rom: no =C2=A0post: no)
Nov 15 15:21:54 fedora kernel: input: Video Bus as /devices/pci0000:00/acpi=
.video_bus.0/input/input18
Nov 15 15:21:54 fedora kernel: i915 0000:00:02.0: [drm] HDaudio controller =
not detected, using LPE audio instead
Nov 15 15:21:54 fedora kernel: fbcon: i915drmfb (fb0) is primary device
Nov 15 15:21:54 fedora kernel: fbcon: Deferring console take-over
Nov 15 15:21:54 fedora kernel: i915 0000:00:02.0: [drm] fb0: i915drmfb fram=
e buffer device
Nov 15 15:21:55 fedora kernel: BTRFS: device label fedora devid 1 transid 1=
997 /dev/mmcblk0p3 (179:3) scanned by mount (386)
Nov 15 15:21:55 fedora kernel: BTRFS info (device mmcblk0p3): first mount o=
f filesystem 7b058820-b885-4f5a-9c19-e76481acd1b7
Nov 15 15:21:55 fedora kernel: BTRFS info (device mmcblk0p3): using crc32c =
checksum algorithm
Nov 15 15:21:55 fedora kernel: BTRFS info (device mmcblk0p3): enabling ssd =
optimizations
Nov 15 15:21:55 fedora kernel: BTRFS info (device mmcblk0p3): turning on as=
ync discard
Nov 15 15:21:55 fedora kernel: BTRFS info (device mmcblk0p3): enabling free=
 space tree
Nov 15 15:21:55 fedora kernel: mmc1: new UHS-I speed SDR104 SDXC card at ad=
dress 0001
Nov 15 15:21:55 fedora kernel: mmcblk1: mmc1:0001 EC2QT 59.6 GiB
Nov 15 15:21:55 fedora kernel: =C2=A0mmcblk1: p1
Nov 15 15:22:01 fedora systemd-journald[196]: Received SIGTERM from PID 1 (=
systemd).
Nov 15 15:22:01 fedora kernel: audit: type=3D1404 audit(1794752517.173:2): =
enforcing=3D1 old_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=
=3D1 old-enabled=3D1 lsm=3Dselinux res=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission firmware_load in c=
lass system not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission kexec_image_load i=
n class system not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission kexec_initramfs_lo=
ad in class system not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission policy_load in cla=
ss system not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission x509_certificate_l=
oad in class system not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission map_create_as in c=
lass bpf not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission prog_load_as in cl=
ass bpf not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Permission allowed in class i=
o_uring not defined in policy.
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0Class memfd_file not defined =
in policy.
Nov 15 15:22:01 fedora kernel: SELinux: the above unknown classes and permi=
ssions will be allowed
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability network_pee=
r_controls=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability open_perms=
=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability extended_so=
cket_class=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability always_chec=
k_network=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability cgroup_secl=
abel=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability nnp_nosuid_=
transition=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability genfs_secla=
bel_symlinks=3D1
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability ioctl_skip_=
cloexec=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability userspace_i=
nitial_context=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability netlink_xpe=
rm=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability netif_wildc=
ard=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability genfs_secla=
bel_wildcard=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability functionfs_=
seclabel=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability memfd_class=
=3D0
Nov 15 15:22:01 fedora kernel: SELinux: =C2=A0policy capability bpf_token_p=
erms=3D0
Nov 15 15:22:01 fedora kernel: audit: type=3D1403 audit(1794752517.400:3): =
auid=3D4294967295 ses=3D4294967295 lsm=3Dselinux res=3D1
Nov 15 15:22:01 fedora systemd[1]: Successfully loaded SELinux policy in 23=
3.074ms.
Nov 15 15:22:01 fedora systemd[1]: Relabeled /dev/, /dev/shm/, /run/ in 76.=
273ms.
Nov 15 15:22:01 fedora systemd[1]: systemd 262.1-1.fc45 running in system m=
ode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +IPE +SMACK +SECCOMP +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPT=
SETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +L=
Z4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
Nov 15 15:22:01 fedora systemd[1]: Detected architecture x86-64.
Nov 15 15:22:01 fedora systemd[1]: bpf-restrict-fs: LSM BPF program attache=
d
Nov 15 15:22:01 fedora kernel: zram: Added device: zram0
Nov 15 15:22:01 fedora systemd[1]: initrd-switch-root.service: Deactivated =
successfully.
Nov 15 15:22:01 fedora systemd[1]: Stopped initrd-switch-root.service - Swi=
tch Root.
Nov 15 15:22:01 fedora systemd[1]: systemd-journald.service: Scheduled rest=
art job, restart counter is at 1.
Nov 15 15:22:01 fedora systemd[1]: Created slice machine.slice - Virtual Ma=
chine and Container Slice.
Nov 15 15:22:01 fedora systemd[1]: Created slice system-getty.slice - Slice=
 /system/getty.
Nov 15 15:22:01 fedora systemd[1]: Created slice system-kmsconvt.slice - Sl=
ice /system/kmsconvt.
Nov 15 15:22:01 fedora systemd[1]: Created slice system-systemd\x2dfsck.sli=
ce - Slice /system/systemd-fsck.
Nov 15 15:22:01 fedora systemd[1]: Created slice system-systemd\x2dzram\x2d=
setup.slice - Slice /system/systemd-zram-setup.
Nov 15 15:22:01 fedora systemd[1]: Created slice user.slice - User and Sess=
ion Slice.
Nov 15 15:22:01 fedora systemd[1]: systemd-ask-password-console.path - Disp=
atch Password Requests to Console Directory Watch skipped, unmet condition =
check ConditionPathExists=3D!/run/plymouth/pid
Nov 15 15:22:01 fedora systemd[1]: Started systemd-ask-password-wall.path -=
 Forward Password Requests to Wall Directory Watch.
Nov 15 15:22:01 fedora systemd[1]: Set up automount proc-sys-fs-binfmt_misc=
.automount - Arbitrary Executable File Formats File System Automount Point.
Nov 15 15:22:01 fedora systemd[1]: Expecting device dev-disk-by\x2duuid-3f7=
ecc18\x2dcc13\x2d48ec\x2da6d5\x2d6c67213968b5.device - /dev/disk/by-uuid/3f=
7ecc18-cc13-48ec-a6d5-6c67213968b5...
Nov 15 15:22:01 fedora systemd[1]: Expecting device dev-disk-by\x2duuid-6cd=
70374\x2d2a95\x2d478b\x2dbc96\x2daa44e229696e.device - /dev/disk/by-uuid/6c=
d70374-2a95-478b-bc96-aa44e229696e...
Nov 15 15:22:01 fedora systemd[1]: Expecting device dev-disk-by\x2duuid-7b0=
58820\x2db885\x2d4f5a\x2d9c19\x2de76481acd1b7.device - /dev/disk/by-uuid/7b=
058820-b885-4f5a-9c19-e76481acd1b7...
Nov 15 15:22:01 fedora systemd[1]: Expecting device dev-disk-by\x2duuid-A74=
1\x2d482D.device - /dev/disk/by-uuid/A741-482D...
Nov 15 15:22:01 fedora systemd[1]: Expecting device dev-zram0.device - /dev=
/zram0...
Nov 15 15:22:01 fedora systemd[1]: Reached target clonesetup.target - Local=
 dm-clone Devices.
Nov 15 15:22:01 fedora systemd[1]: Reached target getty.target - Login Prom=
pts.
Nov 15 15:22:01 fedora systemd[1]: Reached target imports.target - Image Do=
wnloads.
Nov 15 15:22:01 fedora systemd[1]: Stopped target initrd-switch-root.target=
 - Switch Root.
Nov 15 15:22:01 fedora systemd[1]: Stopped target initrd-fs.target - Initrd=
 File Systems.
Nov 15 15:22:01 fedora systemd[1]: Stopped target initrd-root-fs.target - I=
nitrd Root File System.
Nov 15 15:22:01 fedora systemd[1]: Reached target integritysetup.target - L=
ocal Integrity Protected Volumes.
Nov 15 15:22:01 fedora systemd[1]: Reached target slices.target - Slice Uni=
ts.
Nov 15 15:22:01 fedora systemd[1]: Reached target veritysetup.target - Loca=
l Verity Protected Volumes.
Nov 15 15:22:01 fedora systemd[1]: Listening on dm-event.socket - Device-ma=
pper event daemon FIFOs.
Nov 15 15:22:01 fedora systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2=
 poll daemon socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-ask-password.socket=
 - Query the User Interactively for a Password.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-coredump.socket - P=
rocess Core Dump Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-creds.socket - Cred=
ential Encryption/Decryption.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-cryptenroll.socket =
- Disk Encryption Enrollment Service Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-factory-reset.socke=
t - Factory Reset Management.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-hostnamed.socket - =
Hostname Service Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-journald-audit.sock=
et - Journal Audit Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-mute-console.socket=
 - Console Output Muting Service Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-oomd.socket - Users=
pace Out-Of-Memory (OOM) Killer Socket.
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrextend.socket - TPM PCR Measu=
rements skipped, unmet condition check ConditionSecurity=3Dmeasured-os
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrlock.socket - Make TPM PCR Po=
licy skipped, unmet condition check ConditionSecurity=3Dmeasured-uki
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-repart.socket - Dis=
k Repartitioning Service Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-resolved-monitor.so=
cket - Resolve Monitor Varlink Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-resolved-varlink.so=
cket - Resolve Service Varlink Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-storage-block.socke=
t - Simple Block Device Backed Storage Provider.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-storage-fs.socket -=
 Simple File System Backed Storage Provider.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-sysinstall.socket -=
 System Install Tool.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-sysupdate.socket - =
System Updates.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-udevd-varlink.socke=
t - udev Varlink Socket.
Nov 15 15:22:01 fedora systemd[1]: Listening on systemd-userdbd.socket - Us=
er Database Manager Socket.
Nov 15 15:22:01 fedora systemd[1]: Mounting dev-hugepages.mount - Huge Page=
s File System...
Nov 15 15:22:01 fedora systemd[1]: Mounting dev-mqueue.mount - POSIX Messag=
e Queue File System...
Nov 15 15:22:01 fedora systemd[1]: Mounting sys-kernel-debug.mount - Kernel=
 Debug File System...
Nov 15 15:22:01 fedora systemd[1]: Mounting sys-kernel-tracing.mount - Kern=
el Trace File System...
Nov 15 15:22:01 fedora systemd[1]: auth-rpcgss-module.service - Kernel Modu=
le supporting RPCSEC_GSS skipped, unmet condition check ConditionPathExists=
=3D/etc/krb5.keytab
Nov 15 15:22:01 fedora systemd[1]: fips-crypto-policy-overlay.service - Bin=
d-mount FIPS crypto-policy in FIPS mode skipped, unmet condition check Cond=
itionKernelCommandLine=3Dfips=3D1
Nov 15 15:22:01 fedora systemd[1]: iscsi-starter.service skipped, unmet con=
dition check ConditionDirectoryNotEmpty=3D/var/lib/iscsi/nodes
Nov 15 15:22:01 fedora systemd[1]: Starting kmod-static-nodes.service - Cre=
ate List of Static Device Nodes...
Nov 15 15:22:01 fedora systemd[1]: Starting lvm2-monitor.service - Monitori=
ng of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
Nov 15 15:22:01 fedora systemd[1]: modprobe@configfs.service - Load Kernel =
Module configfs skipped, unmet condition check ConditionKernelModuleLoaded=
=3D!configfs
Nov 15 15:22:01 fedora systemd[1]: modprobe@drm.service - Load Kernel Modul=
e drm skipped, unmet condition check ConditionKernelModuleLoaded=3D!drm
Nov 15 15:22:01 fedora systemd[1]: modprobe@efi_pstore.service - Load Kerne=
l Module efi_pstore skipped, unmet condition check ConditionKernelModuleLoa=
ded=3D!efi_pstore
Nov 15 15:22:01 fedora systemd[1]: modprobe@fuse.service - Load Kernel Modu=
le fuse skipped, unmet condition check ConditionKernelModuleLoaded=3D!fuse
Nov 15 15:22:01 fedora systemd[1]: Mounting sys-fs-fuse-connections.mount -=
 FUSE Control File System...
Nov 15 15:22:01 fedora systemd[1]: plymouth-switch-root.service: Deactivate=
d successfully.
Nov 15 15:22:01 fedora systemd[1]: Stopped plymouth-switch-root.service - P=
lymouth switch root service.
Nov 15 15:22:01 fedora systemd[1]: systemd-boot-clear-sysfail.service - Cle=
ar SysFail Entry If The Boot Is Successful skipped, unmet condition check C=
onditionPathExists=3D/sys/firmware/efi/efivars/LoaderEntrySysFail-4a67b082-=
0a4c-41cf-b6c7-440b29bb8c4f
Nov 15 15:22:01 fedora systemd[1]: systemd-fsck-root.service: Deactivated s=
uccessfully.
Nov 15 15:22:01 fedora systemd[1]: Stopped systemd-fsck-root.service - File=
 System Check on Root Device.
Nov 15 15:22:01 fedora systemd[1]: systemd-hibernate-clear.service - Clear =
Stale Hibernate Storage Info skipped, unmet condition check ConditionPathEx=
ists=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-=
6d876050dc67
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-journald.service - Jour=
nal Service...
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-modules-load.service - =
Load Kernel Modules...
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-network-generator.servi=
ce - Generate Network Units from Kernel Command Line...
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrmachine.service - TPM PCR Mac=
hine ID Measurement skipped, unmet condition check ConditionSecurity=3Dmeas=
ured-os
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrosseparator.service - TPM PCR=
 OS Separator skipped, unmet condition check ConditionSecurity=3Dmeasured-o=
s
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-remount-fs.service - Re=
mount Root and Kernel File Systems...
Nov 15 15:22:01 fedora systemd[1]: systemd-tpm2-setup-early.service - Early=
 TPM SRK Setup skipped, unmet condition check ConditionSecurity=3Dmeasured-=
os
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrnvdone.service - TPM PCR NvPC=
R Initialization Separator skipped, unmet condition check ConditionPathExis=
ts=3D/etc/initrd-release
Nov 15 15:22:01 fedora systemd[1]: Reached target cryptsetup.target - Local=
 Encrypted Volumes.
Nov 15 15:22:01 fedora systemd[1]: systemd-pcrproduct.service - TPM NvPCR P=
roduct ID Measurement skipped, unmet condition check ConditionSecurity=3Dme=
asured-os
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-udev-load-credentials.s=
ervice - Load udev Rules from Credentials...
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-udev-trigger.service - =
Coldplug All udev Devices...
Nov 15 15:22:01 fedora kernel: BTRFS info (device mmcblk0p3 state M): use z=
std compression, level 1
Nov 15 15:22:01 fedora systemd[1]: Mounted dev-hugepages.mount - Huge Pages=
 File System.
Nov 15 15:22:01 fedora systemd[1]: Mounted dev-mqueue.mount - POSIX Message=
 Queue File System.
Nov 15 15:22:01 fedora systemd[1]: Mounted sys-kernel-debug.mount - Kernel =
Debug File System.
Nov 15 15:22:01 fedora systemd[1]: Mounted sys-kernel-tracing.mount - Kerne=
l Trace File System.
Nov 15 15:22:01 fedora systemd[1]: Finished kmod-static-nodes.service - Cre=
ate List of Static Device Nodes.
Nov 15 15:22:01 fedora systemd[1]: Mounted sys-fs-fuse-connections.mount - =
FUSE Control File System.
Nov 15 15:22:01 fedora systemd[1]: Finished systemd-modules-load.service - =
Load Kernel Modules.
Nov 15 15:22:01 fedora systemd[1]: Finished systemd-network-generator.servi=
ce - Generate Network Units from Kernel Command Line.
Nov 15 15:22:01 fedora systemd[1]: Finished systemd-remount-fs.service - Re=
mount Root and Kernel File Systems.
Nov 15 15:22:01 fedora systemd[1]: iscsi-onboot.service - Special handling =
of early boot iSCSI sessions skipped, unmet condition check ConditionDirect=
oryNotEmpty=3D/sys/class/iscsi_session
Nov 15 15:22:01 fedora systemd[1]: systemd-hwdb-update.service - Rebuild Ha=
rdware Database skipped, unmet condition check ConditionNeedsUpdate=3D/etc
Nov 15 15:22:01 fedora systemd[1]: systemd-pstore.service - Platform Persis=
tent Storage Archival skipped, unmet condition check ConditionDirectoryNotE=
mpty=3D/sys/fs/pstore
Nov 15 15:22:01 fedora systemd-journald[498]: Collecting audit messages is =
enabled.
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-random-seed.service - L=
oad/Save OS Random Seed...
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-sysctl.service - Apply =
Kernel Variables...
Nov 15 15:22:01 fedora systemd[1]: Starting systemd-tmpfiles-setup-dev-earl=
y.service - Create Static Device Nodes in /dev gracefully...
Nov 15 15:22:01 fedora systemd[1]: systemd-tpm2-setup.service - TPM SRK Set=
up skipped, unmet condition check ConditionSecurity=3Dmeasured-os
Nov 15 15:22:01 fedora systemd[1]: Started systemd-journald.service - Journ=
al Service.
Nov 15 15:22:01 fedora kernel: audit: type=3D1130 audit(1794752521.538:4): =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r=
:init_t:s0 msg=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/=
systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:01 fedora kernel: audit: type=3D1130 audit(1794752521.553:5): =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r=
:init_t:s0 msg=3D'unit=3Dsystemd-udev-load-credentials comm=3D"systemd" exe=
=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsucc=
ess'
Nov 15 15:22:02 fedora systemd-journald[498]: Received client request to fl=
ush runtime journal.
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752521.668:6): =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r=
:init_t:s0 msg=3D'unit=3Dsystemd-random-seed comm=3D"systemd" exe=3D"/usr/l=
ib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752521.720:7): =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r=
:init_t:s0 msg=3D'unit=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/sy=
stemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752521.996:8): =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r=
:init_t:s0 msg=3D'unit=3Dsystemd-tmpfiles-setup-dev-early comm=3D"systemd" =
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1334 audit(1794752522.024:9): =
prog-id=3D48 op=3DLOAD
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.136:10):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-tmpfiles-setup-dev comm=3D"systemd" exe=
=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsucc=
ess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1334 audit(1794752522.144:11):=
 prog-id=3D23 op=3DUNLOAD
Nov 15 15:22:02 fedora kernel: kauditd_printk_skb: 6 callbacks suppressed
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.297:18):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-journal-flush comm=3D"systemd" exe=3D"/us=
r/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.334:19):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-userdbd comm=3D"systemd" exe=3D"/usr/lib/=
systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.596:20):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-resolved comm=3D"systemd" exe=3D"/usr/lib=
/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.689:21):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-udevd comm=3D"systemd" exe=3D"/usr/lib/sy=
stemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: zram0: detected capacity change from 0 to 77=
06624
Nov 15 15:22:02 fedora kernel: audit: type=3D1130 audit(1794752522.812:22):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-zram-setup@zram0 comm=3D"systemd" exe=3D"=
/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:02 fedora kernel: Adding 3853308k swap on /dev/zram0. =C2=
=A0Priority:100 extents:1 across:3853308k SSDsc
Nov 15 15:22:03 fedora kernel: audit: type=3D1130 audit(1794752523.146:23):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dlvm2-monitor comm=3D"systemd" exe=3D"/usr/lib/sys=
temd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:03 fedora kernel: audit: type=3D1130 audit(1794752523.368:24):=
 pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_=
r:init_t:s0 msg=3D'unit=3Dsystemd-udev-trigger comm=3D"systemd" exe=3D"/usr=
/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
Nov 15 15:22:04 fedora kernel: Adding 4187132k swap on /dev/mmcblk0p4. =
=C2=A0Priority:-1 extents:1 across:4187132k SS
Nov 15 15:22:04 fedora kernel: mc: Linux media interface: v0.10
Nov 15 15:22:04 fedora kernel: videodev: Linux video capture interface: v2.=
00
Nov 15 15:22:04 fedora kernel: kxcjk1013 i2c-KIOX000A:00: mounting matrix n=
ot found: using identity...
Nov 15 15:22:04 fedora kernel: kxcjk1013 i2c-KIOX000A:00: supply vdd not fo=
und, using dummy regulator
Nov 15 15:22:04 fedora kernel: kxcjk1013 i2c-KIOX000A:00: supply vddio not =
found, using dummy regulator
Nov 15 15:22:04 fedora kernel: audit: type=3D1334 audit(1794752524.975:25):=
 prog-id=3D54 op=3DLOAD
Nov 15 15:22:04 fedora kernel: audit: type=3D1334 audit(1794752524.975:26):=
 prog-id=3D55 op=3DLOAD
Nov 15 15:22:04 fedora kernel: audit: type=3D1334 audit(1794752524.976:27):=
 prog-id=3D56 op=3DLOAD
Nov 15 15:22:05 fedora kernel: Bluetooth: Core ver 2.22
Nov 15 15:22:05 fedora kernel: NET: Registered PF_BLUETOOTH protocol family
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI device and connection manager=
 initialized
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI socket layer initialized
Nov 15 15:22:05 fedora kernel: Bluetooth: L2CAP socket layer initialized
Nov 15 15:22:05 fedora kernel: Bluetooth: SCO socket layer initialized
Nov 15 15:22:05 fedora kernel: input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=
=3D0 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input19
Nov 15 15:22:05 fedora kernel: input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=
=3D1 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input20
Nov 15 15:22:05 fedora kernel: input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=
=3D2 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input21
Nov 15 15:22:05 fedora kernel: EXT4-fs (mmcblk0p2): mounted filesystem 3f7e=
cc18-cc13-48ec-a6d5-6c67213968b5 r/w with ordered data mode. Quota mode: no=
ne.
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART driver ver 2.3
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol H4 registered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol BCSP registered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol LL registered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol ATH3K registere=
d
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol Three-wire (H5)=
 registered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol Intel registere=
d
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol Broadcom regist=
ered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol QCA registered
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol AG6XX registere=
d
Nov 15 15:22:05 fedora kernel: Bluetooth: HCI UART protocol Marvell registe=
red
Nov 15 15:22:05 fedora kernel: rt5645 i2c-10EC5645:00: Detected Lenovo Idea=
pad Miix 310 platform
Nov 15 15:22:05 fedora kernel: rt5645 i2c-10EC5645:00: supply avdd not foun=
d, using dummy regulator
Nov 15 15:22:05 fedora kernel: rt5645 i2c-10EC5645:00: supply cpvdd not fou=
nd, using dummy regulator
Nov 15 15:22:06 fedora kernel: axp288_extcon axp288_extcon: controlling USB=
 role based on Vbus presence
Nov 15 15:22:06 fedora kernel: input: PC Speaker as /devices/platform/pcspk=
r/input/input22
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: examining hci_ver=3D06=
 hci_rev=3D000b lmp_ver=3D06 lmp_subver=3D8723
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: rom_version status=3D0=
 version=3D1
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: btrtl_initialize: key =
id 0
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8723=
bs_fw.bin
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8723=
bs_config-OBDA8723.bin
Nov 15 15:22:06 fedora kernel: Bluetooth: hci0: RTL: cfg_sz 64, total sz 24=
508
Nov 15 15:22:06 fedora kernel: iTCO_wdt iTCO_wdt.4.auto: Found a Braswell S=
oC TCO device (Version=3D3, TCOBASE=3D0x0460)
Nov 15 15:22:06 fedora kernel: iTCO_wdt iTCO_wdt.4.auto: initialized. heart=
beat=3D30 sec (nowayout=3D0)
Nov 15 15:22:07 fedora kernel: cfg80211: Loading compiled-in X.509 certific=
ates for regulatory database
Nov 15 15:22:07 fedora kernel: Loaded X.509 cert 'sforshee: 00b28ddf47aef9c=
ea7'
Nov 15 15:22:07 fedora kernel: Loaded X.509 cert 'wens: 61c038651aabdcf94bd=
0ac7ff06c7248db18c600'
Nov 15 15:22:07 fedora kernel: Bluetooth: hci0: RTL: fw version 0x365d462e
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: LPE base: 0x9140=
0000 size:0x200000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: IRAM base: 0x914=
c0000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: DRAM base: 0x915=
00000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: SHIM base: 0x915=
40000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: Mailbox base: 0x=
91544000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: DDR base: 0x2000=
0000
Nov 15 15:22:07 fedora kernel: intel_sst_acpi 808622A8:00: Got drv data max=
 stream 25
Nov 15 15:22:07 fedora kernel: intel_rapl_common: Found RAPL domain package
Nov 15 15:22:07 fedora kernel: intel_rapl_common: Found RAPL domain core
Nov 15 15:22:07 fedora kernel: r8723bs: module is from the staging director=
y, the quality is unknown, you have been warned.
Nov 15 15:22:07 fedora kernel: pnetdev =3D 0000000036a30a6b
Nov 15 15:22:07 fedora kernel: RPC: Registered named UNIX socket transport =
module.
Nov 15 15:22:07 fedora kernel: RPC: Registered udp transport module.
Nov 15 15:22:07 fedora kernel: RPC: Registered tcp transport module.
Nov 15 15:22:07 fedora kernel: RPC: Registered tcp-with-tls transport modul=
e.
Nov 15 15:22:07 fedora kernel: RPC: Registered tcp NFSv4.1 backchannel tran=
sport module.
Nov 15 15:22:07 fedora kernel: rt5645 i2c-10EC5645:00: Detected Lenovo Idea=
pad Miix 310 platform
Nov 15 15:22:07 fedora kernel: rt5645 i2c-10EC5645:00: Detected Lenovo Idea=
pad Miix 310 platform
Nov 15 15:22:07 fedora kernel: ------------[ cut here ]------------
Nov 15 15:22:07 fedora kernel: UBSAN: shift-out-of-bounds in sound/soc/soc-=
dapm.c:433:15
Nov 15 15:22:07 fedora kernel: shift exponent 16384 is too large for 32-bit=
 type 'unsigned int'
Nov 15 15:22:07 fedora kernel: CPU: 2 UID: 0 PID: 572 Comm: (udev-worker) T=
ainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A07.3.3-300.fc45.x86_64 #1 PREEMPT(lazy)
Nov 15 15:22:07 fedora kernel: Tainted: [C]=3DCRAP
Nov 15 15:22:07 fedora kernel: Hardware name: LENOVO 80SG/Cavalli, BIOS 1HC=
N42WW 04/05/2017
Nov 15 15:22:07 fedora kernel: Call Trace:
Nov 15 15:22:07 fedora kernel: =C2=A0<TASK>
Nov 15 15:22:07 fedora kernel: =C2=A0dump_stack_lvl+0x5d/0x80
Nov 15 15:22:07 fedora kernel: =C2=A0ubsan_epilogue+0x5/0x2b
Nov 15 15:22:07 fedora kernel: =C2=A0__ubsan_handle_shift_out_of_bounds.col=
d+0xd7/0x1ab
Nov 15 15:22:07 fedora kernel: =C2=A0dapm_add_path.cold+0x15/0xd6 [snd_soc_=
core]
Nov 15 15:22:07 fedora kernel: =C2=A0snd_soc_dapm_add_route+0x4a4/0x660 [sn=
d_soc_core]
Nov 15 15:22:07 fedora kernel: =C2=A0snd_soc_dapm_add_routes+0x52/0x90 [snd=
_soc_core]
Nov 15 15:22:07 fedora kernel: =C2=A0soc_probe_component+0x223/0x300 [snd_s=
oc_core]
Nov 15 15:22:07 fedora kernel: =C2=A0snd_soc_bind_card+0x43f/0x8a0 [snd_soc=
_core]
Nov 15 15:22:07 fedora kernel: =C2=A0? __pfx_devm_card_bind_release+0x10/0x=
10 [snd_soc_core]
Nov 15 15:22:07 fedora kernel: =C2=A0call_soc_bind_card+0x6c/0xd0 [snd_soc_=
core]
Nov 15 15:22:07 fedora kernel: =C2=A0snd_soc_register_card+0x122/0x150 [snd=
_soc_core]
Nov 15 15:22:07 fedora kernel: =C2=A0snd_cht_mc_probe+0x3fd/0x710 [snd_soc_=
sst_cht_bsw_rt5645]
Nov 15 15:22:07 fedora kernel: =C2=A0? kernfs_activate+0x4c/0x60
Nov 15 15:22:07 fedora kernel: =C2=A0? kernfs_add_one+0x140/0x180
Nov 15 15:22:07 fedora kernel: =C2=A0? acpi_dev_pm_attach+0x30/0x120
Nov 15 15:22:07 fedora kernel: =C2=A0platform_probe+0x67/0x90
Nov 15 15:22:07 fedora kernel: =C2=A0call_driver_probe+0x23/0x100
Nov 15 15:22:07 fedora kernel: =C2=A0? driver_sysfs_add+0x55/0xc0
Nov 15 15:22:07 fedora kernel: =C2=A0really_probe+0xd7/0x2d0
Nov 15 15:22:07 fedora kernel: =C2=A0? __pm_runtime_resume+0x5f/0x90
Nov 15 15:22:07 fedora kernel: =C2=A0__driver_probe_device+0x9c/0x1b0
Nov 15 15:22:07 fedora kernel: =C2=A0? platform_match+0x96/0xf0
Nov 15 15:22:07 fedora kernel: =C2=A0driver_probe_device+0x1f/0x80
Nov 15 15:22:07 fedora kernel: =C2=A0? __pfx___driver_attach+0x10/0x10
Nov 15 15:22:07 fedora kernel: =C2=A0__driver_attach+0xcc/0x200
Nov 15 15:22:07 fedora kernel: =C2=A0? __pfx___driver_attach+0x10/0x10
Nov 15 15:22:07 fedora kernel: =C2=A0bus_for_each_dev+0x97/0x100
Nov 15 15:22:07 fedora kernel: =C2=A0bus_add_driver+0x15c/0x260
Nov 15 15:22:07 fedora kernel: =C2=A0? __pfx_init_module+0x10/0x10 [snd_soc=
_sst_cht_bsw_rt5645]
Nov 15 15:22:07 fedora kernel: =C2=A0driver_register+0x75/0xe0
Nov 15 15:22:07 fedora kernel: =C2=A0do_one_initcall+0x89/0x3d0
Nov 15 15:22:07 fedora kernel: =C2=A0do_init_module+0x8e/0x2b0
Nov 15 15:22:07 fedora kernel: =C2=A0init_module_from_file+0xc8/0x180
Nov 15 15:22:07 fedora kernel: =C2=A0idempotent_init_module+0x23e/0x360
Nov 15 15:22:07 fedora kernel: =C2=A0__x64_sys_finit_module+0x7f/0x110
Nov 15 15:22:07 fedora kernel: =C2=A0do_syscall_64+0xbe/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? switch_fpu_return+0x5e/0xf0
Nov 15 15:22:07 fedora kernel: =C2=A0? arch_exit_to_user_mode_prepare.isra.=
0+0x84/0xa0
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? audit_reset_context+0x295/0x300
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? audit_reset_context+0x295/0x300
Nov 15 15:22:07 fedora kernel: =C2=A0? __audit_syscall_exit+0xa1/0x100
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0? do_syscall_64+0x37/0x470
Nov 15 15:22:07 fedora kernel: =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
Nov 15 15:22:07 fedora kernel: RIP: 0033:0x7fc095b72f0d
Nov 15 15:22:07 fedora kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90=
 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c=
 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d bb 2e 08 00 f7 d8 64 89 =
01 48
Nov 15 15:22:07 fedora kernel: RSP: 002b:00007ffece4f59c8 EFLAGS: 00000246 =
ORIG_RAX: 0000000000000139
Nov 15 15:22:07 fedora kernel: RAX: ffffffffffffffda RBX: 000055649d404640 =
RCX: 00007fc095b72f0d
Nov 15 15:22:07 fedora kernel: RDX: 0000000000000004 RSI: 00007fc096224888 =
RDI: 000000000000003c
Nov 15 15:22:07 fedora kernel: RBP: 00007ffece4f5a60 R08: 0000000000000000 =
R09: 0000000000000000
Nov 15 15:22:07 fedora kernel: R10: 0000000000000000 R11: 0000000000000246 =
R12: 00007fc096224888
Nov 15 15:22:07 fedora kernel: R13: 000055649d403b90 R14: 0000000000020000 =
R15: 0000000000000000
Nov 15 15:22:07 fedora kernel: =C2=A0</TASK>
Nov 15 15:22:07 fedora kernel: ---[ end trace ]---
Nov 15 15:22:08 fedora kernel: input: chtrt5645 Headset as /devices/pci0000=
:00/808622A8:00/cht-bsw-rt5645/sound/card1/input23
Nov 15 15:22:08 fedora kernel: ------------[ cut here ]------------
Nov 15 15:22:08 fedora kernel: UBSAN: shift-out-of-bounds in sound/soc/soc-=
dapm.c:3516:13
Nov 15 15:22:08 fedora kernel: shift exponent 16384 is too large for 32-bit=
 type 'unsigned int'
Nov 15 15:22:08 fedora kernel: CPU: 3 UID: 0 PID: 710 Comm: alsactl Tainted=
: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07.3.3-3=
00.fc45.x86_64 #1 PREEMPT(lazy)
Nov 15 15:22:08 fedora kernel: Tainted: [C]=3DCRAP
Nov 15 15:22:08 fedora kernel: Hardware name: LENOVO 80SG/Cavalli, BIOS 1HC=
N42WW 04/05/2017
Nov 15 15:22:08 fedora kernel: Call Trace:
Nov 15 15:22:08 fedora kernel: =C2=A0<TASK>
Nov 15 15:22:08 fedora kernel: =C2=A0dump_stack_lvl+0x5d/0x80
Nov 15 15:22:08 fedora kernel: =C2=A0ubsan_epilogue+0x5/0x2b
Nov 15 15:22:08 fedora kernel: =C2=A0__ubsan_handle_shift_out_of_bounds.col=
d+0xd7/0x1ab
Nov 15 15:22:08 fedora kernel: =C2=A0snd_soc_dapm_put_volsw.cold+0x68/0x139=
 [snd_soc_core]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_elem_write+0x19a/0x1f0 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_ioctl+0x52a/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __wake_up+0x44/0x60
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0__x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0do_syscall_64+0xbe/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? snd_ctl_ioctl+0x31e/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0x37/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
Nov 15 15:22:08 fedora kernel: RIP: 0033:0x7f3aa93678dd
Nov 15 15:22:08 fedora kernel: Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48=
 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00=
 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 =
00 00
Nov 15 15:22:08 fedora kernel: RSP: 002b:00007ffcc6f8a120 EFLAGS: 00000246 =
ORIG_RAX: 0000000000000010
Nov 15 15:22:08 fedora kernel: RAX: ffffffffffffffda RBX: 0000000000000001 =
RCX: 00007f3aa93678dd
Nov 15 15:22:08 fedora kernel: RDX: 00007ffcc6f8a2b0 RSI: 00000000c4c85513 =
RDI: 0000000000000004
Nov 15 15:22:08 fedora kernel: RBP: 00007ffcc6f8a170 R08: 00007ffcc6f8a2b0 =
R09: 0000000000000000
Nov 15 15:22:08 fedora kernel: R10: 0000feff00000000 R11: 0000000000000246 =
R12: 0000000000000001
Nov 15 15:22:08 fedora kernel: R13: 0000000000000115 R14: 0000000000000001 =
R15: 000055e8af450f87
Nov 15 15:22:08 fedora kernel: =C2=A0</TASK>
Nov 15 15:22:08 fedora kernel: ---[ end trace ]---
Nov 15 15:22:08 fedora kernel: ------------[ cut here ]------------
Nov 15 15:22:08 fedora kernel: UBSAN: shift-out-of-bounds in sound/soc/soc-=
dapm.c:3517:15
Nov 15 15:22:08 fedora kernel: shift exponent 16384 is too large for 32-bit=
 type 'unsigned int'
Nov 15 15:22:08 fedora kernel: CPU: 3 UID: 0 PID: 710 Comm: alsactl Tainted=
: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07.3.3-3=
00.fc45.x86_64 #1 PREEMPT(lazy)
Nov 15 15:22:08 fedora kernel: Tainted: [C]=3DCRAP
Nov 15 15:22:08 fedora kernel: Hardware name: LENOVO 80SG/Cavalli, BIOS 1HC=
N42WW 04/05/2017
Nov 15 15:22:08 fedora kernel: Call Trace:
Nov 15 15:22:08 fedora kernel: =C2=A0<TASK>
Nov 15 15:22:08 fedora kernel: =C2=A0dump_stack_lvl+0x5d/0x80
Nov 15 15:22:08 fedora kernel: =C2=A0ubsan_epilogue+0x5/0x2b
Nov 15 15:22:08 fedora kernel: =C2=A0__ubsan_handle_shift_out_of_bounds.col=
d+0xd7/0x1ab
Nov 15 15:22:08 fedora kernel: =C2=A0snd_soc_dapm_put_volsw.cold+0xa8/0x139=
 [snd_soc_core]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_elem_write+0x19a/0x1f0 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_ioctl+0x52a/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __wake_up+0x44/0x60
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0__x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0do_syscall_64+0xbe/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? snd_ctl_ioctl+0x31e/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0x37/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
Nov 15 15:22:08 fedora kernel: RIP: 0033:0x7f3aa93678dd
Nov 15 15:22:08 fedora kernel: Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48=
 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00=
 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 =
00 00
Nov 15 15:22:08 fedora kernel: RSP: 002b:00007ffcc6f8a120 EFLAGS: 00000246 =
ORIG_RAX: 0000000000000010
Nov 15 15:22:08 fedora kernel: RAX: ffffffffffffffda RBX: 0000000000000001 =
RCX: 00007f3aa93678dd
Nov 15 15:22:08 fedora kernel: RDX: 00007ffcc6f8a2b0 RSI: 00000000c4c85513 =
RDI: 0000000000000004
Nov 15 15:22:08 fedora kernel: RBP: 00007ffcc6f8a170 R08: 00007ffcc6f8a2b0 =
R09: 0000000000000000
Nov 15 15:22:08 fedora kernel: R10: 0000feff00000000 R11: 0000000000000246 =
R12: 0000000000000001
Nov 15 15:22:08 fedora kernel: R13: 0000000000000115 R14: 0000000000000001 =
R15: 000055e8af450f87
Nov 15 15:22:08 fedora kernel: =C2=A0</TASK>
Nov 15 15:22:08 fedora kernel: ---[ end trace ]---
Nov 15 15:22:08 fedora kernel: ------------[ cut here ]------------
Nov 15 15:22:08 fedora kernel: UBSAN: shift-out-of-bounds in sound/soc/soc-=
dapm.c:3519:47
Nov 15 15:22:08 fedora kernel: shift exponent 16384 is too large for 32-bit=
 type 'unsigned int'
Nov 15 15:22:08 fedora kernel: CPU: 3 UID: 0 PID: 710 Comm: alsactl Tainted=
: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07.3.3-3=
00.fc45.x86_64 #1 PREEMPT(lazy)
Nov 15 15:22:08 fedora kernel: Tainted: [C]=3DCRAP
Nov 15 15:22:08 fedora kernel: Hardware name: LENOVO 80SG/Cavalli, BIOS 1HC=
N42WW 04/05/2017
Nov 15 15:22:08 fedora kernel: Call Trace:
Nov 15 15:22:08 fedora kernel: =C2=A0<TASK>
Nov 15 15:22:08 fedora kernel: =C2=A0dump_stack_lvl+0x5d/0x80
Nov 15 15:22:08 fedora kernel: =C2=A0ubsan_epilogue+0x5/0x2b
Nov 15 15:22:08 fedora kernel: =C2=A0__ubsan_handle_shift_out_of_bounds.col=
d+0xd7/0x1ab
Nov 15 15:22:08 fedora kernel: =C2=A0snd_soc_dapm_put_volsw.cold+0x8d/0x139=
 [snd_soc_core]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_elem_write+0x19a/0x1f0 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0snd_ctl_ioctl+0x52a/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __wake_up+0x44/0x60
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0__x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0do_syscall_64+0xbe/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? snd_ctl_ioctl+0x31e/0x940 [snd]
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? __seccomp_filter+0x8a/0x3d0
Nov 15 15:22:08 fedora kernel: =C2=A0? __x64_sys_ioctl+0xb9/0x100
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0xfa/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0? do_syscall_64+0x37/0x470
Nov 15 15:22:08 fedora kernel: =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
Nov 15 15:22:08 fedora kernel: RIP: 0033:0x7f3aa93678dd
Nov 15 15:22:08 fedora kernel: Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48=
 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00=
 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 =
00 00
Nov 15 15:22:08 fedora kernel: RSP: 002b:00007ffcc6f8a120 EFLAGS: 00000246 =
ORIG_RAX: 0000000000000010
Nov 15 15:22:08 fedora kernel: RAX: ffffffffffffffda RBX: 0000000000000001 =
RCX: 00007f3aa93678dd
Nov 15 15:22:08 fedora kernel: RDX: 00007ffcc6f8a2b0 RSI: 00000000c4c85513 =
RDI: 0000000000000004
Nov 15 15:22:08 fedora kernel: RBP: 00007ffcc6f8a170 R08: 00007ffcc6f8a2b0 =
R09: 0000000000000000
Nov 15 15:22:08 fedora kernel: R10: 0000feff00000000 R11: 0000000000000246 =
R12: 0000000000000001
Nov 15 15:22:08 fedora kernel: R13: 0000000000000115 R14: 0000000000000001 =
R15: 000055e8af450f87
Nov 15 15:22:08 fedora kernel: =C2=A0</TASK>
Nov 15 15:22:08 fedora kernel: ---[ end trace ]---
Nov 15 15:22:09 fedora kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Nov 15 15:22:09 fedora kernel: Bluetooth: BNEP filters: protocol multicast
Nov 15 15:22:09 fedora kernel: Bluetooth: BNEP socket layer initialized
Nov 15 15:22:09 fedora kernel: Bluetooth: MGMT ver 1.23
Nov 15 15:22:10 fedora kernel: rtl8723bs: acquire FW from file:rtlwifi/rtl8=
723bs_nic.bin
Nov 15 15:22:11 fedora kernel: NET: Registered PF_QIPCRTR protocol family
Nov 15 15:22:14 fedora kernel: BUG: kernel NULL pointer dereference, addres=
s: 0000000000000000
Nov 15 15:22:14 fedora kernel: #PF: supervisor read access in kernel mode
Nov 15 15:22:14 fedora kernel: #PF: error_code(0x0000) - not-present page
Nov 15 15:22:14 fedora kernel: PGD 0 P4D 0
Nov 15 15:22:14 fedora kernel: Oops: Oops: 0000 [#1] SMP PTI
Nov 15 15:22:14 fedora kernel: CPU: 0 UID: 0 PID: 881 Comm: RTW_CMD_THREAD =
Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A07.3.3-300.fc45.x86_64 #1 PREEMPT(lazy)
Nov 15 15:22:14 fedora kernel: Tainted: [C]=3DCRAP
Nov 15 15:22:14 fedora kernel: Hardware name: LENOVO 80SG/Cavalli, BIOS 1HC=
N42WW 04/05/2017
Nov 15 15:22:14 fedora kernel: RIP: 0010:GetDeltaSwingTable_8723B+0x28/0xc0=
 [r8723bs]
Nov 15 15:22:14 fedora kernel: Code: 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b=
 07 49 89 f1 48 8b 80 c8 43 00 00 0f b6 40 10 83 e8 01 3c 0d 77 48 48 8b 87=
 00 01 00 00 <0f> b7 00 66 83 f8 16 77 5d be 14 08 40 00 48 0f a3 c6 73 52 =
4c 8d
Nov 15 15:22:14 fedora kernel: RSP: 0000:ffffd0ee03577d38 EFLAGS: 00010297
Nov 15 15:22:14 fedora kernel: RAX: 0000000000000000 RBX: ffffd0ee00379000 =
RCX: ffffd0ee03577d80
Nov 15 15:22:14 fedora kernel: RDX: ffffd0ee03577d78 RSI: ffffd0ee03577d70 =
RDI: ffffd0ee0037b818
Nov 15 15:22:14 fedora kernel: RBP: ffffd0ee0037b818 R08: ffffd0ee03577d88 =
R09: ffffd0ee03577d70
Nov 15 15:22:14 fedora kernel: R10: 000000000000d96a R11: 0000000000000000 =
R12: 0000000000000000
Nov 15 15:22:14 fedora kernel: R13: ffff8bfa01e0f780 R14: ffffd0ee00379000 =
R15: 0000000000000000
Nov 15 15:22:14 fedora kernel: FS: =C2=A00000000000000000(0000) GS:ffff8bfa=
ee247000(0000) knlGS:0000000000000000
Nov 15 15:22:14 fedora kernel: CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
Nov 15 15:22:14 fedora kernel: CR2: 0000000000000000 CR3: 000000010c840000 =
CR4: 00000000001026f0
Nov 15 15:22:14 fedora kernel: Call Trace:
Nov 15 15:22:14 fedora kernel: =C2=A0<TASK>
Nov 15 15:22:14 fedora kernel: =C2=A0ODM_TXPowerTrackingCallback_ThermalMet=
er+0xb7/0xc30 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_ODM_TxPwrTrackSetPwr_8723B+0x1=
0/0x10 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_PHY_LCCalibrate_8723B+0x10/0x1=
0 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_GetDeltaSwingTable_8723B+0x10/=
0x10 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? rtw_write8+0x1f/0x30 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? odm_CCKPacketDetectionThresh+0x9a/0x=
d0 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0ODM_DMWatchdog+0x17c/0x230 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0rtl8723b_HalDmWatchDog+0xf6/0x140 [r87=
23bs]
Nov 15 15:22:14 fedora kernel: =C2=A0rtw_drvextra_cmd_hdl+0x208/0x370 [r872=
3bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_rtw_drvextra_cmd_hdl+0x10/0x10=
 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0rtw_cmd_thread+0x27a/0x4d0 [r8723bs]
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_rtw_cmd_thread+0x10/0x10 [r872=
3bs]
Nov 15 15:22:14 fedora kernel: =C2=A0kthread+0xe6/0x120
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_kthread+0x10/0x10
Nov 15 15:22:14 fedora kernel: =C2=A0ret_from_fork+0x1a3/0x270
Nov 15 15:22:14 fedora kernel: =C2=A0? __pfx_kthread+0x10/0x10
Nov 15 15:22:14 fedora kernel: =C2=A0ret_from_fork_asm+0x1a/0x30
Nov 15 15:22:14 fedora kernel: =C2=A0</TASK>
Nov 15 15:22:14 fedora kernel: Modules linked in: nf_conntrack_netbios_ns n=
f_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_re=
ject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_=
nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr bnep snd_soc_=
sst_cht_bsw_rt5645 snd_sof_acpi_intel_byt snd_sof_acpi snd_sof_intel_atom s=
unrpc snd_sof_xtensa_dsp r8723bs(C) snd_sof intel_rapl_msr intel_powerclamp=
 coretemp kvm_intel snd_sof_utils snd_intel_sst_acpi snd_intel_dspcfg cfg80=
211 snd_intel_sdw_acpi kvm snd_intel_sst_core mei_hdcp mei_pxp iTCO_wdt int=
el_pmc_bxt snd_soc_sst_atom_hifi2_platform irqbypass vfat pcspkr extcon_axp=
288 intel_cstate axp288_charger fat axp288_adc axp288_fuel_gauge axp20x_pek=
 libarc4 mei_txe snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks hc=
i_uart mei snd_soc_acpi snd_soc_rt5645 snd_soc_sdca lpc_ich snd_soc_rl6231 =
snd_soc_core intel_xhci_usb_role_switch btqca btrtl snd_compress btbcm ov26=
80 btintel ac97_bus snd_hdmi_lpe_audio snd_pcm_dmaengine v4l2_cci v4l2_fwno=
de
Nov 15 15:22:14 fedora kernel: =C2=A0snd_seq processor_thermal_device_pci_l=
egacy bluetooth v4l2_async processor_thermal_device kxcjk_1013 processor_th=
ermal_wt_hint platform_temperature_control videodev industrialio_triggered_=
buffer processor_thermal_soc_slider kfifo_buf processor_thermal_rfim indust=
rialio snd_seq_device processor_thermal_rapl mc rfkill pwrseq_core intel_ra=
pl_common snd_pcm snd_timer snd processor_thermal_wt_req soundcore processo=
r_thermal_power_floor processor_thermal_mbox intel_soc_dts_iosf int3403_the=
rmal int3406_thermal intel_int0002_vgpio int3400_thermal acpi_pad int340x_t=
hermal_zone acpi_thermal_rel intel_atomisp2_pm joydev zram lz4hc_compress i=
915 hid_multitouch mmc_block rpmb_core gpio_keys i2c_hid_acpi spi_pxa2xx_pl=
atform i2c_hid sdhci_acpi drm_buddy i2c_algo_bit video sdhci wmi ttm dw_dma=
c mmc_core pwm_lpss_platform spi_pxa2xx_core pwm_lpss drm_display_helper so=
c_button_array cec fuse i2c_dev
Nov 15 15:22:14 fedora kernel: CR2: 0000000000000000
Nov 15 15:22:14 fedora kernel: ---[ end trace 0000000000000000 ]---
Nov 15 15:22:14 fedora kernel: RIP: 0010:GetDeltaSwingTable_8723B+0x28/0xc0=
 [r8723bs]
Nov 15 15:22:14 fedora kernel: Code: 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b=
 07 49 89 f1 48 8b 80 c8 43 00 00 0f b6 40 10 83 e8 01 3c 0d 77 48 48 8b 87=
 00 01 00 00 <0f> b7 00 66 83 f8 16 77 5d be 14 08 40 00 48 0f a3 c6 73 52 =
4c 8d
Nov 15 15:22:14 fedora kernel: RSP: 0000:ffffd0ee03577d38 EFLAGS: 00010297
Nov 15 15:22:14 fedora kernel: RAX: 0000000000000000 RBX: ffffd0ee00379000 =
RCX: ffffd0ee03577d80
Nov 15 15:22:14 fedora kernel: RDX: ffffd0ee03577d78 RSI: ffffd0ee03577d70 =
RDI: ffffd0ee0037b818
Nov 15 15:22:14 fedora kernel: RBP: ffffd0ee0037b818 R08: ffffd0ee03577d88 =
R09: ffffd0ee03577d70
Nov 15 15:22:14 fedora kernel: R10: 000000000000d96a R11: 0000000000000000 =
R12: 0000000000000000
Nov 15 15:22:14 fedora kernel: R13: ffff8bfa01e0f780 R14: ffffd0ee00379000 =
R15: 0000000000000000
Nov 15 15:22:14 fedora kernel: FS: =C2=A00000000000000000(0000) GS:ffff8bfa=
ee247000(0000) knlGS:0000000000000000
Nov 15 15:22:14 fedora kernel: CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
Nov 15 15:22:14 fedora kernel: CR2: 0000000000000000 CR3: 000000010c840000 =
CR4: 00000000001026f0
Nov 15 15:22:14 fedora kernel: note: RTW_CMD_THREAD[881] exited with irqs d=
isabled
Nov 15 15:22:18 fedora kernel: i2c i2c-OVTI2680:01: deferred probe pending:=
 ov2680: waiting for fwnode graph endpoint
Nov 15 15:23:16 fedora kernel: intel_sst_acpi 808622A8:00: FW Version 01.0b=
.02.02
Nov 15 15:23:17 fedora kernel: Bluetooth: RFCOMM TTY layer initialized
Nov 15 15:23:17 fedora kernel: Bluetooth: RFCOMM socket layer initialized
Nov 15 15:23:17 fedora kernel: Bluetooth: RFCOMM ver 1.11
Nov 15 15:23:27 fedora kernel: rfkill: input handler disabled
Nov 15 15:25:57 fedora kernel: rfkill: input handler enabled
Nov 15 15:26:07 fedora kernel: rfkill: input handler disabled
Nov 15 15:26:42 fedora kernel: evm: overlay not supported
